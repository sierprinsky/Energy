/*
 * This file is part of the Score-P software (http://www.score-p.org)
 *
 * Copyright (c) 2009-2013,
 * RWTH Aachen University, Germany
 *
 * Copyright (c) 2009-2013,
 * Gesellschaft fuer numerische Simulation mbH Braunschweig, Germany
 *
 * Copyright (c) 2009-2014,
 * Technische Universitaet Dresden, Germany
 *
 * Copyright (c) 2009-2013,
 * University of Oregon, Eugene, USA
 *
 * Copyright (c) 2009-2014,
 * Forschungszentrum Juelich GmbH, Germany
 *
 * Copyright (c) 2009-2013,
 * German Research School for Simulation Sciences GmbH, Juelich/Aachen, Germany
 *
 * Copyright (c) 2009-2013,
 * Technische Universitaet Muenchen, Germany
 *
 * This software may be modified and distributed under the terms of
 * a BSD-style license.  See the COPYING file in the package base
 * directory for details.
 *
 */

#include <stdlib.h>
#include <iostream>
#include <vector>

#include <mpi.h>

#include <otf2/otf2.h>

#if MPI_VERSION < 3
#define OTF2_MPI_UINT64_T MPI_UNSIGNED_LONG
#define OTF2_MPI_INT64_T  MPI_LONG
#endif
#include <otf2/OTF2_MPI_Collectives.h>

static OTF2_CallbackCode
Enter_print( OTF2_LocationRef    location,
             OTF2_TimeStamp      time,
             void*               userData,
             OTF2_AttributeList* attributes,
             OTF2_RegionRef      region )
{
    std::cout << "Entering region " << region << " at location " << location << " at time " << time << std::endl;

    return OTF2_CALLBACK_SUCCESS;
}

static OTF2_CallbackCode
Leave_print( OTF2_LocationRef    location,
             OTF2_TimeStamp      time,
             void*               userData,
             OTF2_AttributeList* attributes,
             OTF2_RegionRef      region )
{
    std::cout << "Leaving region " << region << " at location " << location << " at time " << time << std::endl;

    return OTF2_CALLBACK_SUCCESS;
}

static OTF2_CallbackCode
GlobDefLocation_Register( void*                 userData,
                          OTF2_LocationRef      location,
                          OTF2_StringRef        name,
                          OTF2_LocationType     locationType,
                          uint64_t              numberOfEvents,
                          OTF2_LocationGroupRef locationGroup )
{
    std::vector<OTF2_LocationRef>* locations =
        ( std::vector<OTF2_LocationRef>* )userData;

    locations->push_back( location );

    return OTF2_CALLBACK_SUCCESS;
}

int
main( int    argc,
      char** argv )
{
    MPI_Init( &argc, &argv );
    int size;
    MPI_Comm_size( MPI_COMM_WORLD, &size );
    int rank;
    MPI_Comm_rank( MPI_COMM_WORLD, &rank );

    OTF2_Reader* reader = OTF2_Reader_Open( "ArchivePath/ArchiveName.otf2" );

    OTF2_MPI_Reader_SetCollectiveCallbacks( reader, MPI_COMM_WORLD );

    uint64_t number_of_locations;
    OTF2_Reader_GetNumberOfLocations( reader,
                                      &number_of_locations );
    std::vector<OTF2_LocationRef> locations;
    locations.reserve( number_of_locations );

    OTF2_GlobalDefReader* global_def_reader = OTF2_Reader_GetGlobalDefReader( reader );

    OTF2_GlobalDefReaderCallbacks* global_def_callbacks = OTF2_GlobalDefReaderCallbacks_New();
    OTF2_GlobalDefReaderCallbacks_SetLocationCallback( global_def_callbacks,
                                                       &GlobDefLocation_Register );
    OTF2_Reader_RegisterGlobalDefCallbacks( reader,
                                            global_def_reader,
                                            global_def_callbacks,
                                            &locations );
    OTF2_GlobalDefReaderCallbacks_Delete( global_def_callbacks );

    uint64_t definitions_read = 0;
    OTF2_Reader_ReadAllGlobalDefinitions( reader,
                                          global_def_reader,
                                          &definitions_read );

    uint64_t number_of_locations_to_read = 0;
    for ( std::size_t i = 0; i < locations.size(); i++ )
    {
        if ( locations[ i ] % size != rank )
        {
            continue;
        }
        number_of_locations_to_read++;
        OTF2_Reader_SelectLocation( reader, locations[ i ] );
    }

    bool successful_open_def_files =
        OTF2_Reader_OpenDefFiles( reader ) == OTF2_SUCCESS;
    OTF2_Reader_OpenEvtFiles( reader );

    for ( std::size_t i = 0; i < locations.size(); i++ )
    {
        if ( locations[ i ] % size != rank )
        {
            continue;
        }

        if ( successful_open_def_files )
        {
            OTF2_DefReader* def_reader =
                OTF2_Reader_GetDefReader( reader, locations[ i ] );
            if ( def_reader )
            {
                uint64_t def_reads = 0;
                OTF2_Reader_ReadAllLocalDefinitions( reader,
                                                     def_reader,
                                                     &def_reads );
                OTF2_Reader_CloseDefReader( reader, def_reader );
            }
        }
        OTF2_EvtReader* evt_reader =
            OTF2_Reader_GetEvtReader( reader, locations[ i ] );
    }

    if ( successful_open_def_files )
    {
        OTF2_Reader_CloseDefFiles( reader );
    }

    if ( number_of_locations_to_read > 0 )
    {
        OTF2_GlobalEvtReader* global_evt_reader = OTF2_Reader_GetGlobalEvtReader( reader );

        OTF2_GlobalEvtReaderCallbacks* event_callbacks = OTF2_GlobalEvtReaderCallbacks_New();
        OTF2_GlobalEvtReaderCallbacks_SetEnterCallback( event_callbacks,
                                                        &Enter_print );
        OTF2_GlobalEvtReaderCallbacks_SetLeaveCallback( event_callbacks,
                                                        &Leave_print );
        OTF2_Reader_RegisterGlobalEvtCallbacks( reader,
                                                global_evt_reader,
                                                event_callbacks,
                                                NULL );
        OTF2_GlobalEvtReaderCallbacks_Delete( event_callbacks );

        uint64_t events_read = 0;
        OTF2_Reader_ReadAllGlobalEvents( reader,
                                         global_evt_reader,
                                         &events_read );

        OTF2_Reader_CloseGlobalEvtReader( reader, global_evt_reader );
    }
    OTF2_Reader_CloseEvtFiles( reader );

    OTF2_Reader_Close( reader );

    MPI_Finalize();

    return EXIT_SUCCESS;
}
