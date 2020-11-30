##*************************************************************************##
##  CUBE        http://www.scalasca.org/                                   ##
##*************************************************************************##
##  Copyright (c) 1998-2019                                                ##
##  Forschungszentrum Juelich GmbH, Juelich Supercomputing Centre          ##
##                                                                         ##
##  Copyright (c) 2009-2015                                                ##
##  German Research School for Simulation Sciences GmbH,                   ##
##  Laboratory for Parallel Programming                                    ##
##                                                                         ##
##  This software may be modified and distributed under the terms of       ##
##  a BSD-style license.  See the COPYING file in the package base         ##
##  directory for details.                                                 ##
##*************************************************************************##


CONFIG	+=  exceptions warn_on release c++1z
TEMPLATE = lib
DESTDIR_TARGET = 
CUBE_SRC = ../../../src/cube
CSTR_SRC = ../../../vendor/common/src/utils/cstr
EXCEPTION_SRC = ../../../vendor/common/src/utils/exception
IO_SRC = ../../../vendor/common/src/utils/io
UTILS_INCLUDE = ../../../vendor/common/src/utils/include
LOCAL_UTILS_INCLUDE = ../../../vpath/include/cubelib
COMMON_SRC = ../../../src/tools/
TOOLS_LIBRARY_SRC = ../../../src/tools/tools/0001.library


CUBE += 
DEPENDPATH += . 
INCLUDEPATH += $${CUBE_SRC}/ $${CUBE_SRC}/.. $${CUBE_SRC}/../../vpath/src/ \
     $${CSTR_SRC} \
     $${EXCEPTION_SRC} \
     $${IO_SRC} \
     $${UTILS_INCLUDE} \
	 $${COMMON_SRC} \
	  $${COMMON_SRC}/common_inc  \
	 $${LOCAL_UTILS_INCLUDE} \
     $${CUBE_SRC}/include/service\
	 $${CUBE_SRC}/include/service/cubelayout \
	 $${CUBE_SRC}/include/service/cubelayout/layout \
	 $${CUBE_SRC}/include/service/cubelayout/readers \
	 $${CUBE_SRC}/include/dimensions/metric \
	 $${CUBE_SRC}/include/dimensions/metric/strategies \
	 $${CUBE_SRC}/include/dimensions/metric/data \
	 $${CUBE_SRC}/include/dimensions/metric/cache \
	 $${CUBE_SRC}/include/dimensions/metric/data/rows \
	 $${CUBE_SRC}/include/dimensions/metric/matrix \
	 $${CUBE_SRC}/include/dimensions/metric/index \
	 $${CUBE_SRC}/include/dimensions/metric/value \
	 $${CUBE_SRC}/include/dimensions/metric/value/trafo \
	 $${CUBE_SRC}/include/dimensions/metric/value/trafo/single_value \
	 $${CUBE_SRC}/include/dimensions/calltree \
	 $${CUBE_SRC}/include/dimensions/system \
	 $${CUBE_SRC}/include/dimensions \
	 $${CUBE_SRC}/include/network \
	 $${CUBE_SRC}/include/syntax \
	 $${CUBE_SRC}/include/syntax/cubepl/evaluators \
	 $${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary \
	 $${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/statements \
	 $${CUBE_SRC}/include/syntax/cubepl/evaluators/unary \
	 $${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument \
	 $${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/two_arguments \
	 $${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/lambda_calcul \
	 $${CUBE_SRC}/include/syntax/cubepl/evaluators/binary \
	 $${CUBE_SRC}/include/syntax/cubepl \
	 $${CUBE_SRC}/include/derivated \
	 $${CUBE_SRC}/include/topologies \
	 $${CUBE_SRC}/include \
	 ${MINGW}/opt/include \
	 "C:/Program Files (x86)/GnuWin32/include"
	 
	 
	 #C:/Scalasca-Soft/Misc/regex-2.7-bin/include 
	 
#LIBS += -LC:/Scalasca-Soft/Misc/regex-2.7-bin/lib -lregex
LIBS += -L"C:/Program Files (x86)/GnuWin32/lib" -lz
LIBS += -L${MINGW}/opt/lib -lregex
RESOURCES = 
DEFINES+= NOCROSS_BUILD
DEFINES+= BACKEND_BUILD_NOMPI
DEFINES+= FRONTEND_CUBE_COMPRESSED_READONLY=yes
DEFINES+= __MINGW32__

QMAKE_CXXFLAGS+=-fexceptions
QMAKE_CFLAGS+=-std=c99

QT += 

# Input{
HEADERS += \
$${COMMON_SRC}/common_inc/Filter.h \
$${COMMON_SRC}/common_inc/Predicates.h \
$${COMMON_SRC}/common_inc/algebra4-internals.h \
$${COMMON_SRC}/common_inc/algebra4.h \
$${COMMON_SRC}/common_inc/enums.h \
$${COMMON_SRC}/common_inc/helper.h \
$${CUBE_SRC}/../cubelib-config-custom.h \
$${CUBE_SRC}/include/Cube.h \
$${CUBE_SRC}/include/CubeIoProxy.h \
$${CUBE_SRC}/include/CubeNetworkProxy.h \
$${CUBE_SRC}/include/CubeProxy.h \
$${CUBE_SRC}/include/derivated/AggrCube.h \
$${CUBE_SRC}/include/derivated/AggrCubeMaps.h \
$${CUBE_SRC}/include/dimensions/CubeIdentObject.h \
$${CUBE_SRC}/include/dimensions/CubeSerializableVertex.h \
$${CUBE_SRC}/include/dimensions/CubeVertex.h \
$${CUBE_SRC}/include/dimensions/calltree/CubeCnode.h \
$${CUBE_SRC}/include/dimensions/calltree/CubeRegion.h \
$${CUBE_SRC}/include/dimensions/metric/CubeCustomPreDerivedExclusiveMetric.h \
$${CUBE_SRC}/include/dimensions/metric/CubeCustomPreDerivedInclusiveMetric.h \
$${CUBE_SRC}/include/dimensions/metric/CubeExclusiveMetric.h \
$${CUBE_SRC}/include/dimensions/metric/CubeExclusiveMetricBuildInType.h \
$${CUBE_SRC}/include/dimensions/metric/CubeExclusiveMetricBuildInType.h \
$${CUBE_SRC}/include/dimensions/metric/CubeInclusiveMetric.h \
$${CUBE_SRC}/include/dimensions/metric/CubeMetric.h \
$${CUBE_SRC}/include/dimensions/metric/CubeMetricBuildInType.h \
$${CUBE_SRC}/include/dimensions/metric/CubeMetricValueType.h \
$${CUBE_SRC}/include/dimensions/metric/CubePostDerivedMetric.h \
$${CUBE_SRC}/include/dimensions/metric/CubePreDerivedExclusiveMetric.h \
$${CUBE_SRC}/include/dimensions/metric/CubePreDerivedInclusiveMetric.h \
$${CUBE_SRC}/include/dimensions/metric/cache/CubeCache.h \
$${CUBE_SRC}/include/dimensions/metric/cache/CubeSimpleCache.h \
$${CUBE_SRC}/include/dimensions/metric/data/CubeDataMarker.h \
$${CUBE_SRC}/include/dimensions/metric/data/CubeZDataMarker.h \
$${CUBE_SRC}/include/dimensions/metric/data/rows/CubeMemoryRowsSupplier.h \
$${CUBE_SRC}/include/dimensions/metric/data/rows/CubeRORowsSupplier.h \
$${CUBE_SRC}/include/dimensions/metric/data/rows/CubeROZRowsSupplier.h \
$${CUBE_SRC}/include/dimensions/metric/data/rows/CubeRow.h \
$${CUBE_SRC}/include/dimensions/metric/data/rows/CubeRowsManager.h \
$${CUBE_SRC}/include/dimensions/metric/data/rows/CubeRowsSupplier.h \
$${CUBE_SRC}/include/dimensions/metric/data/rows/CubeRowsSuppliers.h \
$${CUBE_SRC}/include/dimensions/metric/data/rows/CubeSwapRowsSupplier.h \
$${CUBE_SRC}/include/dimensions/metric/data/rows/CubeWORowsSupplier.h \
$${CUBE_SRC}/include/dimensions/metric/data/rows/CubeWOZRowsSupplier.h \
$${CUBE_SRC}/include/dimensions/metric/index/CubeDenseIndex.h \
$${CUBE_SRC}/include/dimensions/metric/index/CubeIndex.h \
$${CUBE_SRC}/include/dimensions/metric/index/CubeIndexHeader.h \
$${CUBE_SRC}/include/dimensions/metric/index/CubeIndexManager.h \
$${CUBE_SRC}/include/dimensions/metric/index/CubeIndexMarker.h \
$${CUBE_SRC}/include/dimensions/metric/index/CubeIndexes.h \
$${CUBE_SRC}/include/dimensions/metric/index/CubeSparseIndex.h \
$${CUBE_SRC}/include/dimensions/metric/matrix/CubeAdvMatrix.h \
$${CUBE_SRC}/include/dimensions/metric/matrix/CubeRowWiseMatrix.h \
$${CUBE_SRC}/include/dimensions/metric/strategies/CubeAllInMemoryPreloadStrategy.h \
$${CUBE_SRC}/include/dimensions/metric/strategies/CubeAllInMemoryStrategy.h \
$${CUBE_SRC}/include/dimensions/metric/strategies/CubeBasicStrategy.h \
$${CUBE_SRC}/include/dimensions/metric/strategies/CubeLastNRowsStrategy.h \
$${CUBE_SRC}/include/dimensions/metric/strategies/CubeManualStrategy.h \
$${CUBE_SRC}/include/dimensions/metric/strategies/CubeStrategies.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeCharValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeComplexValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeDoubleValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeHistogramValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeMaxDoubleValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeMinDoubleValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeNDoublesValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeRateValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeScaleFuncValue.h \	
$${CUBE_SRC}/include/dimensions/metric/value/CubeSignedLongValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeSignedShortValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeSignedValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeStatLevel1Value.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeStatLevel2Value.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeStatLevel3Value.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeStatLevel4Value.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeStringValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeTauAtomicValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeUnsignedLongValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeUnsignedShortValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeUnsignedValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeValue.h \
$${CUBE_SRC}/include/dimensions/metric/value/CubeValues.h \
$${CUBE_SRC}/include/dimensions/metric/value/trafo/single_value/CubeNOPTrafo.h \
$${CUBE_SRC}/include/dimensions/metric/value/trafo/single_value/CubeSingleValueTrafo.h \
$${CUBE_SRC}/include/dimensions/metric/value/trafo/single_value/CubeSwapBytesTrafo.h \
$${CUBE_SRC}/include/dimensions/metric/value/trafo/single_value/CubeTrafos.h \
$${CUBE_SRC}/include/dimensions/system/CubeLocation.h \
$${CUBE_SRC}/include/dimensions/system/CubeLocationGroup.h \
$${CUBE_SRC}/include/dimensions/system/CubeMachine.h \
$${CUBE_SRC}/include/dimensions/system/CubeNode.h \
$${CUBE_SRC}/include/dimensions/system/CubeProcess.h \
$${CUBE_SRC}/include/dimensions/system/CubeSysres.h \
$${CUBE_SRC}/include/dimensions/system/CubeSystemTreeNode.h \
$${CUBE_SRC}/include/dimensions/system/CubeThread.h \
$${CUBE_SRC}/include/network/CubeCallpathSubtreeValuesRequest.h \
$${CUBE_SRC}/include/network/CubeCallpathTreeValuesRequest.h \
$${CUBE_SRC}/include/network/CubeClientCallbackData.h \
$${CUBE_SRC}/include/network/CubeClientConnection.h \
$${CUBE_SRC}/include/network/CubeClientServerVersionRequest.h \
$${CUBE_SRC}/include/network/CubeCloseCubeRequest.h \
$${CUBE_SRC}/include/network/CubeConnection.h \
$${CUBE_SRC}/include/network/CubeDefineMetricRequest.h \
$${CUBE_SRC}/include/network/CubeDisconnectRequest.h \
$${CUBE_SRC}/include/network/CubeFlatTreeValuesRequest.h \
$${CUBE_SRC}/include/network/CubeMetricSubtreeValuesRequest.h \
$${CUBE_SRC}/include/network/CubeMetricTreeValuesRequest.h \
$${CUBE_SRC}/include/network/CubeNegotiateProtocolRequest.h \
$${CUBE_SRC}/include/network/CubeNetworkRequest.h \
$${CUBE_SRC}/include/network/CubeOpenCubeRequest.h \
$${CUBE_SRC}/include/network/CubePosixStreamSocket.h \
$${CUBE_SRC}/include/network/CubeProtocol.h \
$${CUBE_SRC}/include/network/CubeSaveCubeRequest.h \
$${CUBE_SRC}/include/network/CubeSerializable.h \
$${CUBE_SRC}/include/network/CubeSerializablesFactory.h \
$${CUBE_SRC}/include/network/CubeServerCallbackData.h \
$${CUBE_SRC}/include/network/CubeServerConnection.h \
$${CUBE_SRC}/include/network/CubeSocket.h \
$${CUBE_SRC}/include/network/CubeSystemTreeValuesRequest.h \
$${CUBE_SRC}/include/network/CubeUrl.h \
$${CUBE_SRC}/include/network/cube_network_types.h \
$${CUBE_SRC}/include/service/CubeAbstractFactory.h \
$${CUBE_SRC}/include/service/CubeAggregator.h \
$${CUBE_SRC}/include/service/CubeAlgorithm.h \
$${CUBE_SRC}/include/service/CubeCountedPtr.h \
$${CUBE_SRC}/include/service/CubeDeepSearchEnumerator.h \
$${CUBE_SRC}/include/service/CubeEnumerators.h \
$${CUBE_SRC}/include/service/CubeError.h \
$${CUBE_SRC}/include/service/CubeIDdeliverer.h \
$${CUBE_SRC}/include/service/CubeIdIndexMap.h \
$${CUBE_SRC}/include/service/CubeIstream.h \
$${CUBE_SRC}/include/service/CubeObjectsEnumerator.h \
$${CUBE_SRC}/include/service/CubeOperator.h \
$${CUBE_SRC}/include/service/CubePlatformsCompat.h \
$${CUBE_SRC}/include/service/CubeSelections.h \
$${CUBE_SRC}/include/service/CubeServices.h \
$${CUBE_SRC}/include/service/CubeSingleton.h \
$${CUBE_SRC}/include/service/CubeTypes.h \
$${CUBE_SRC}/include/service/CubeWideSearchEnumerator.h \
$${CUBE_SRC}/include/service/CubeZfstream.h \
$${CUBE_SRC}/include/service/cubelayout/CubeFileFinder.h \
$${CUBE_SRC}/include/service/cubelayout/layout/CubeFileBaseLayout.h \
$${CUBE_SRC}/include/service/cubelayout/layout/CubeFileEmbeddedLayout.h \
$${CUBE_SRC}/include/service/cubelayout/layout/CubeLayoutDetector.h \
$${CUBE_SRC}/include/service/cubelayout/layout/CubeLayouts.h \
$${CUBE_SRC}/include/service/cubelayout/layout/CubeVirtualLayout.h \
$${CUBE_SRC}/include/service/cubelayout/readers/CubeSimpleReader.h \
$${CUBE_SRC}/include/service/cubelayout/readers/CubeTarReader.h \
$${CUBE_SRC}/include/syntax/Cube4Parser.h \
$${CUBE_SRC}/include/syntax/Cube4Scanner.h \
$${CUBE_SRC}/include/syntax/CubeDriver.h \
$${CUBE_SRC}/include/syntax/CubeParseContext.h \
$${CUBE_SRC}/include/syntax/FlexLexer.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL0Driver.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL0MemoryInitializer.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL0MemoryManager.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL0ParseContext.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL0Parser.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL0Scanner.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL1Driver.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL1MemoryInitializer.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL1MemoryManager.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL1ParseContext.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL1Parser.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL1Scanner.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL2MemoryInitializer.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL2MemoryManager.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePL2LocalMemoryManager.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePLDriver.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePLMemoryInitializer.h \
$${CUBE_SRC}/include/syntax/cubepl/CubePLMemoryManager.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/CubeEvaluators.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/CubeGeneralEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeAndEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeBiggerEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeBinaryEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeDivideEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeEqualEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeHalfBiggerEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeHalfSmallerEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeMinusEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeMultEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeNotEqualEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeOrEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubePlusEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubePowerEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeRegexEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeSmallerEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeStringEqualityEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeStringSemiEqualityEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/binary/CubeXorEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/CubeArgumentEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/CubeCalcFlavorModificators.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/CubeConstantEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/CubeDefinedVariableEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/CubeDirectMetricEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/CubeNullaryEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/CubeSizeOfVariableEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/CubeStringConstantEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/CubeStringEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/statements/CubeAssignmentEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/statements/CubeExtendedIfEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/statements/CubeFullIfEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/statements/CubeMetricSetEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/statements/CubeShortIfEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/statements/CubeVariableEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/nullary/statements/CubeWhileEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/CubeEncapsulation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/CubeEnvEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/CubeLowerCaseEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/CubeMetricGetEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/CubeNegativeEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/CubeNotEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/CubeUnaryEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/CubeUpperCaseEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/lambda_calcul/CubeLambdaCalculEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeACosEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeASinEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeATanEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeAbsEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeCeilEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeCosEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeExpEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeFloorEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeLnEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeNegEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubePosEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeRandomEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeSgnEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeSinEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeSqrtEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/single_argument/CubeTanEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/two_arguments/CubeMaxEvaluation.h \
$${CUBE_SRC}/include/syntax/cubepl/evaluators/unary/functions/two_arguments/CubeMinEvaluation.h \
$${CUBE_SRC}/include/topologies/CubeCartesian.h \
$${TOOLS_LIBRARY_SRC}/AbridgeTraversal.h \
$${TOOLS_LIBRARY_SRC}/AbstractConstraint.h \
$${TOOLS_LIBRARY_SRC}/AggregatedMetric.h \
$${TOOLS_LIBRARY_SRC}/Blacklist.h \
$${TOOLS_LIBRARY_SRC}/CCnode.h \
$${TOOLS_LIBRARY_SRC}/CMetricCnodeConstraint.h \
$${TOOLS_LIBRARY_SRC}/CRegion.h \
$${TOOLS_LIBRARY_SRC}/Cacheable.h \
$${TOOLS_LIBRARY_SRC}/CnodeConstraint.h \
$${TOOLS_LIBRARY_SRC}/CnodeInfo.h \
$${TOOLS_LIBRARY_SRC}/CnodeMetric.h \
$${TOOLS_LIBRARY_SRC}/CnodeSubForest.h \
$${TOOLS_LIBRARY_SRC}/CnodeSubTree.h \
$${TOOLS_LIBRARY_SRC}/ColorMode.h \
$${TOOLS_LIBRARY_SRC}/ComputeTraversal.h \
$${TOOLS_LIBRARY_SRC}/CowTree.h \
$${TOOLS_LIBRARY_SRC}/DiffPrintTraversal.h \
$${TOOLS_LIBRARY_SRC}/InfoObj.h \
$${TOOLS_LIBRARY_SRC}/MdAggrCube.h \
$${TOOLS_LIBRARY_SRC}/MdTraversal.h \
$${TOOLS_LIBRARY_SRC}/MultiMdAggrCube.h \
$${TOOLS_LIBRARY_SRC}/PrintableCCnode.h \
$${TOOLS_LIBRARY_SRC}/RegionConstraint.h \
$${TOOLS_LIBRARY_SRC}/RegionInfo.h \
$${TOOLS_LIBRARY_SRC}/Traversal.h \
$${TOOLS_LIBRARY_SRC}/TreeConstraint.h \
$${TOOLS_LIBRARY_SRC}/VisitorsMetric.h  \
$${UTILS_INCLUDE}/UTILS_CStr.h \
$${UTILS_INCLUDE}/UTILS_Debug.h \
$${UTILS_INCLUDE}/UTILS_Error.h \
$${UTILS_INCLUDE}/UTILS_IO.h \
$${UTILS_INCLUDE}/utils_package.h 

SOURCES += \
$${COMMON_SRC}/common_src/Filter.cpp \
$${COMMON_SRC}/common_src/Predicates.cpp \
$${COMMON_SRC}/common_src/algebra4-internals.cpp \
$${COMMON_SRC}/common_src/algebra4.cpp \
$${COMMON_SRC}/common_src/helper.cpp \
$${CUBE_SRC}/src/Cube.cpp \
$${CUBE_SRC}/src/CubeAtomicDataRoutines.cpp \
$${CUBE_SRC}/src/CubeAtomicRowWiseDataRoutines.cpp \
$${CUBE_SRC}/src/CubeCalculationListRoutines.cpp \
$${CUBE_SRC}/src/CubeCalculationRoutines.cpp \
$${CUBE_SRC}/src/CubeCalculationRowWiseListRoutines.cpp \
$${CUBE_SRC}/src/CubeCalculationRowWiseRoutines.cpp \
$${CUBE_SRC}/src/CubeIoProxy.cpp \
$${CUBE_SRC}/src/CubeNetworkProxy.cpp \
$${CUBE_SRC}/src/CubeProxy.cpp \
$${CUBE_SRC}/src/derivated/AggrCube.cpp \
$${CUBE_SRC}/src/derivated/AggrCubeMaps.cpp \
$${CUBE_SRC}/src/dimensions/CubeIdentObject.cpp \
$${CUBE_SRC}/src/dimensions/CubeVertex.cpp \
$${CUBE_SRC}/src/dimensions/CubeSerializableVertex.cpp \
$${CUBE_SRC}/src/dimensions/calltree/CubeCnode.cpp \
$${CUBE_SRC}/src/dimensions/calltree/CubeRegion.cpp \
$${CUBE_SRC}/src/dimensions/metric/CubeCustomPreDerivedExclusiveMetric.cpp \
$${CUBE_SRC}/src/dimensions/metric/CubeCustomPreDerivedInclusiveMetric.cpp \
$${CUBE_SRC}/src/dimensions/metric/CubeExclusiveMetric.cpp \
$${CUBE_SRC}/src/dimensions/metric/CubeInclusiveMetric.cpp \
$${CUBE_SRC}/src/dimensions/metric/CubeMetric.cpp \
$${CUBE_SRC}/src/dimensions/metric/CubeMetricBuildInType.cpp \
$${CUBE_SRC}/src/dimensions/metric/CubeMetricCalculation.cpp \
$${CUBE_SRC}/src/dimensions/metric/CubeMetricDepricated.cpp \
$${CUBE_SRC}/src/dimensions/metric/CubeMetricValueType.cpp \
$${CUBE_SRC}/src/dimensions/metric/CubePostDerivedMetric.cpp \
$${CUBE_SRC}/src/dimensions/metric/CubePreDerivedExclusiveMetric.cpp \
$${CUBE_SRC}/src/dimensions/metric/CubePreDerivedInclusiveMetric.cpp \
$${CUBE_SRC}/src/dimensions/metric/data/CubeDataMarker.cpp \
$${CUBE_SRC}/src/dimensions/metric/data/rows/CubeRORowsSupplier.cpp \
$${CUBE_SRC}/src/dimensions/metric/data/rows/CubeROZRowsSupplier.cpp \
$${CUBE_SRC}/src/dimensions/metric/data/rows/CubeRow.cpp \
$${CUBE_SRC}/src/dimensions/metric/data/rows/CubeRowsManager.cpp \
$${CUBE_SRC}/src/dimensions/metric/data/rows/CubeSwapRowsSupplier.cpp \
$${CUBE_SRC}/src/dimensions/metric/data/rows/CubeWORowsSupplier.cpp \
$${CUBE_SRC}/src/dimensions/metric/data/rows/CubeWOZRowsSupplier.cpp \
$${CUBE_SRC}/src/dimensions/metric/index/CubeDenseIndex.cpp \
$${CUBE_SRC}/src/dimensions/metric/index/CubeIndexHeader.cpp \
$${CUBE_SRC}/src/dimensions/metric/index/CubeIndexManager.cpp \
$${CUBE_SRC}/src/dimensions/metric/index/CubeIndexMarker.cpp \
$${CUBE_SRC}/src/dimensions/metric/index/CubeSparseIndex.cpp \
$${CUBE_SRC}/src/dimensions/metric/matrix/CubeAdvMatrix.cpp \
$${CUBE_SRC}/src/dimensions/metric/matrix/CubeRowWiseMatrix.cpp \
$${CUBE_SRC}/src/dimensions/metric/strategies/CubeAllInMemoryPreloadStrategy.cpp \
$${CUBE_SRC}/src/dimensions/metric/strategies/CubeAllInMemoryStrategy.cpp \
$${CUBE_SRC}/src/dimensions/metric/strategies/CubeBasicStrategy.cpp \
$${CUBE_SRC}/src/dimensions/metric/strategies/CubeLastNRowsStrategy.cpp \
$${CUBE_SRC}/src/dimensions/metric/strategies/CubeManualStrategy.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeCharValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeComplexValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeDoubleValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeHistogramValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeMaxDoubleValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeMinDoubleValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeNDoublesValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeRateValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeScaleFuncValue.cpp \	
$${CUBE_SRC}/src/dimensions/metric/value/CubeSignedLongValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeSignedShortValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeSignedValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeStatLevel1Value.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeStatLevel2Value.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeStatLevel3Value.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeStatLevel4Value.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeStringValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeTauAtomicValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeUnsignedLongValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeUnsignedShortValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeUnsignedValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/CubeValue.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/trafo/single_value/CubeNOPTrafo.cpp \
$${CUBE_SRC}/src/dimensions/metric/value/trafo/single_value/CubeSwapBytesTrafo.cpp \
$${CUBE_SRC}/src/dimensions/system/CubeSysres.cpp \
$${CUBE_SRC}/src/dimensions/system/CubeLocation.cpp \
$${CUBE_SRC}/src/dimensions/system/CubeLocationGroup.cpp \
$${CUBE_SRC}/src/dimensions/system/CubeSystemTreeNode.cpp \
$${CUBE_SRC}/src/network/CubeCallpathSubtreeValuesRequest.cpp \
$${CUBE_SRC}/src/network/CubeCallpathTreeValuesRequest.cpp \
$${CUBE_SRC}/src/network/CubeClientCallbackData.cpp \
$${CUBE_SRC}/src/network/CubeClientConnection.cpp \
$${CUBE_SRC}/src/network/CubeClientServerVersionRequest.cpp \
$${CUBE_SRC}/src/network/CubeCloseCubeRequest.cpp \
$${CUBE_SRC}/src/network/CubeConnection.cpp \
$${CUBE_SRC}/src/network/CubeDefineMetricRequest.cpp \
$${CUBE_SRC}/src/network/CubeDisconnectRequest.cpp \
$${CUBE_SRC}/src/network/CubeFlatTreeValuesRequest.cpp \
$${CUBE_SRC}/src/network/CubeMetricSubtreeValuesRequest.cpp \
$${CUBE_SRC}/src/network/CubeMetricTreeValuesRequest.cpp \
$${CUBE_SRC}/src/network/CubeNegotiateProtocolRequest.cpp \
$${CUBE_SRC}/src/network/CubeNetworkRequest.cpp \
$${CUBE_SRC}/src/network/CubeOpenCubeRequest.cpp \
$${CUBE_SRC}/src/network/CubePosixStreamSocket.cpp \
$${CUBE_SRC}/src/network/CubeProtocol.cpp \
$${CUBE_SRC}/src/network/CubeSaveCubeRequest.cpp \
$${CUBE_SRC}/src/network/CubeSerializable.cpp \
$${CUBE_SRC}/src/network/CubeSerializablesFactory.cpp \
$${CUBE_SRC}/src/network/CubeServerCallbackData.cpp \
$${CUBE_SRC}/src/network/CubeServerConnection.cpp \
$${CUBE_SRC}/src/network/CubeSocket.cpp \
$${CUBE_SRC}/src/network/CubeSystemTreeValuesRequest.cpp \
$${CUBE_SRC}/src/network/CubeUrl.cpp \
$${CUBE_SRC}/src/service/CubeDeepSearchEnumerator.cpp \
$${CUBE_SRC}/src/service/CubeError.cpp \
$${CUBE_SRC}/src/service/CubeIdIndexMap.cpp \
$${CUBE_SRC}/src/service/CubeIstream.cpp \
$${CUBE_SRC}/src/service/CubeObjectsEnumerator.cpp \
$${CUBE_SRC}/src/service/CubePlatformsCompat.cpp \
$${CUBE_SRC}/src/service/CubeServices.cpp \
$${CUBE_SRC}/src/service/CubeWideSearchEnumerator.cpp \
$${CUBE_SRC}/src/service/CubeZfstream.cpp \
$${CUBE_SRC}/src/service/cubelayout/CubeFileFinder.cpp \
$${CUBE_SRC}/src/service/cubelayout/layout/CubeFileBaseLayout.cpp \
$${CUBE_SRC}/src/service/cubelayout/layout/CubeFileEmbeddedLayout.cpp \
$${CUBE_SRC}/src/service/cubelayout/layout/CubeLayoutDetector.cpp \
$${CUBE_SRC}/src/service/cubelayout/layout/CubeVirtualLayout.cpp \
$${CUBE_SRC}/src/service/cubelayout/readers/CubeSimpleReader.cpp \
$${CUBE_SRC}/src/service/cubelayout/readers/CubeTarReader.cpp \
$${CUBE_SRC}/src/syntax/Cube4Parser.cpp \
$${CUBE_SRC}/src/syntax/Cube4Scanner.cpp \
$${CUBE_SRC}/src/syntax/CubeDriver.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL0Driver.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL0MemoryInitializer.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL0MemoryManager.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL0Parser.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL0Scanner.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL1Driver.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL1MemoryInitializer.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL1MemoryManager.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL1Parser.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL1Scanner.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL2MemoryInitializer.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL2MemoryManager.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePL2LocalMemoryManager.cpp \
$${CUBE_SRC}/src/syntax/cubepl/CubePLMemoryManager.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/CubeGeneralEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeAndEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeBiggerEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeBinaryEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeDivideEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeEqualEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeHalfBiggerEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeHalfSmallerEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeMinusEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeMultEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeNotEqualEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeOrEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubePlusEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubePowerEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeRegexEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeSmallerEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeStringEqualityEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeStringSemiEqualityEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/binary/CubeXorEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/CubeArgumentEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/CubeConstantEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/CubeDefinedVariableEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/CubeDirectMetricEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/CubeNullaryEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/CubeSizeOfVariableEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/CubeStringConstantEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/CubeStringEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/statements/CubeAssignmentEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/statements/CubeExtendedIfEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/statements/CubeFullIfEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/statements/CubeMetricSetEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/statements/CubeShortIfEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/statements/CubeVariableEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/nullary/statements/CubeWhileEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/CubeEncapsulation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/CubeEnvEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/CubeLowerCaseEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/CubeMetricGetEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/CubeNegativeEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/CubeNotEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/CubeUnaryEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/CubeUpperCaseEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/lambda_calcul/CubeLambdaCalculEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeACosEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeASinEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeATanEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeAbsEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeCeilEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeCosEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeExpEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeFloorEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeLnEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeNegEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubePosEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeRandomEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeSgnEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeSinEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeSqrtEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/single_argument/CubeTanEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/two_arguments/CubeMaxEvaluation.cpp \
$${CUBE_SRC}/src/syntax/cubepl/evaluators/unary/functions/two_arguments/CubeMinEvaluation.cpp \
$${CUBE_SRC}/src/topologies/CubeCartesian.cpp  \
$${TOOLS_LIBRARY_SRC}/AbridgeTraversal.cpp \
$${TOOLS_LIBRARY_SRC}/AbstractConstraint.cpp \
$${TOOLS_LIBRARY_SRC}/AggregatedMetric.cpp \
$${TOOLS_LIBRARY_SRC}/Blacklist.cpp \
$${TOOLS_LIBRARY_SRC}/CCnode.cpp \
$${TOOLS_LIBRARY_SRC}/CMetricCnodeConstraint.cpp \
$${TOOLS_LIBRARY_SRC}/CRegion.cpp \
$${TOOLS_LIBRARY_SRC}/Cacheable.cpp \
$${TOOLS_LIBRARY_SRC}/CnodeConstraint.cpp \
$${TOOLS_LIBRARY_SRC}/CnodeInfo.cpp \
$${TOOLS_LIBRARY_SRC}/CnodeMetric.cpp \
$${TOOLS_LIBRARY_SRC}/CnodeSubForest.cpp \
$${TOOLS_LIBRARY_SRC}/CnodeSubTree.cpp \
$${TOOLS_LIBRARY_SRC}/ComputeTraversal.cpp \
$${TOOLS_LIBRARY_SRC}/CowTree.cpp \
$${TOOLS_LIBRARY_SRC}/DiffPrintTraversal.cpp \
$${TOOLS_LIBRARY_SRC}/MdAggrCube.cpp \
$${TOOLS_LIBRARY_SRC}/MdTraversal.cpp \
$${TOOLS_LIBRARY_SRC}/MultiMdAggrCube.cpp \
$${TOOLS_LIBRARY_SRC}/PrintableCCnode.cpp \
$${TOOLS_LIBRARY_SRC}/RegionConstraint.cpp \
$${TOOLS_LIBRARY_SRC}/RegionInfo.cpp \
$${TOOLS_LIBRARY_SRC}/Traversal.cpp \
$${TOOLS_LIBRARY_SRC}/TreeConstraint.cpp \
$${TOOLS_LIBRARY_SRC}/VisitorsMetric.cpp \
# Additional dependencies
# PRE_TARGETDEPS += $CUBE/lib/libcube4.a


# Hack for IBM AIX
aix-g++ {
  QMAKE_CXXFLAGS_RELEASE += -O0
}
aix-g++-64 {
  QMAKE_CXXFLAGS_RELEASE += -O0
}
