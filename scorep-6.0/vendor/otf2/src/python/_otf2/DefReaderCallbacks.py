
''' Generated by OTF2 Template Engine '''

import ctypes
import traceback
import sys

from .Config import conf, StrParam, str_decode
from .ErrorCodes import ErrorCode, HandleErrorCode
from .GeneralDefinitions import *
from .AttributeValue import AttributeValue
from .Definitions import *
from .Callbacks import callback_wrapper
from .IdMap import IdMap


class DefReaderCallbacks(ctypes.Structure):
    pass

def DefReaderCallbacks_New():
    c_New = conf.lib.OTF2_DefReaderCallbacks_New
    c_New.argtypes = []
    c_New.restype = ctypes.POINTER(DefReaderCallbacks)
    # NOTE: Do not errcheck here. This function returns a value, not an error code
    return c_New()

def DefReaderCallbacks_Delete(defReaderCallbacks):
    c_Delete = conf.lib.OTF2_DefReaderCallbacks_Delete
    c_Delete.argtypes = [ ctypes.POINTER(DefReaderCallbacks) ]
    c_Delete.restype = None
    return c_Delete(defReaderCallbacks)

def DefReaderCallbacks_Clear(defReaderCallbacks):
    c_Clear = conf.lib.OTF2_DefReaderCallbacks_Clear
    c_Clear.argtypes = [ ctypes.POINTER(DefReaderCallbacks) ]
    c_Clear.restype = None
    return c_Clear(defReaderCallbacks)

def _callback_wrapper(type, func, convert_args=None):
    def wrapper(userData, *args):
        if userData:
            py_userData = ctypes.cast(userData, ctypes.py_object).value
        else:
            py_userData = None
        try:
            if convert_args is not None:
                args = convert_args(*args)
            ret = func(py_userData, *args)
            if ret is None:
                ret = CALLBACK_SUCCESS
        except:
            sys.stderr.write("An unhandled python exception has occurred in an "
                             "OTF2_DefReaderCallback:\n")
            sys.stderr.write(traceback.format_exc())
            ret = CALLBACK_ERROR
        return ret.value
    return callback_wrapper(func, wrapper, type)

def _convert_property_union(refered_def, name, type, value):
    union = AttributeValue()
    union._arg_value = value
    return refered_def, name, type, union

_DefReaderCallback_FP_Unknown = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p)

_DefReaderCallback_FP_MappingTable = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, MappingType, ctypes.POINTER(IdMap))

_DefReaderCallback_FP_ClockOffset = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, TimeStamp, ctypes.c_int64, ctypes.c_double)

_DefReaderCallback_FP_String = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, StringRef, ctypes.c_char_p)

_DefReaderCallback_FP_Attribute = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, AttributeRef, StringRef, StringRef, Type)

_DefReaderCallback_FP_SystemTreeNode = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, SystemTreeNodeRef, StringRef, StringRef, SystemTreeNodeRef)

_DefReaderCallback_FP_LocationGroup = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, LocationGroupRef, StringRef, LocationGroupType, SystemTreeNodeRef)

_DefReaderCallback_FP_Location = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, LocationRef, StringRef, LocationType, ctypes.c_uint64, LocationGroupRef)

_DefReaderCallback_FP_Region = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, RegionRef, StringRef, StringRef, StringRef, RegionRole, Paradigm, RegionFlag, StringRef, ctypes.c_uint32, ctypes.c_uint32)

_DefReaderCallback_FP_Callsite = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, CallsiteRef, StringRef, ctypes.c_uint32, RegionRef, RegionRef)

_DefReaderCallback_FP_Callpath = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, CallpathRef, CallpathRef, RegionRef)

_DefReaderCallback_FP_Group = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, GroupRef, StringRef, GroupType, Paradigm, GroupFlag, ctypes.c_uint32, ctypes.POINTER(ctypes.c_uint64))

_DefReaderCallback_FP_MetricMember = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, MetricMemberRef, StringRef, StringRef, MetricType, MetricMode, Type, Base, ctypes.c_int64, StringRef)

_DefReaderCallback_FP_MetricClass = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, MetricRef, ctypes.c_uint8, ctypes.POINTER(MetricMemberRef), MetricOccurrence, RecorderKind)

_DefReaderCallback_FP_MetricInstance = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, MetricRef, MetricRef, LocationRef, MetricScope, ctypes.c_uint64)

_DefReaderCallback_FP_Comm = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, CommRef, StringRef, GroupRef, CommRef)

_DefReaderCallback_FP_Parameter = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, ParameterRef, StringRef, ParameterType)

_DefReaderCallback_FP_RmaWin = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, RmaWinRef, StringRef, CommRef)

_DefReaderCallback_FP_MetricClassRecorder = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, MetricRef, LocationRef)

_DefReaderCallback_FP_SystemTreeNodeProperty = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, SystemTreeNodeRef, StringRef, Type, AttributeValue._arg_type)

_DefReaderCallback_FP_SystemTreeNodeDomain = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, SystemTreeNodeRef, SystemTreeDomain)

_DefReaderCallback_FP_LocationGroupProperty = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, LocationGroupRef, StringRef, Type, AttributeValue._arg_type)

_DefReaderCallback_FP_LocationProperty = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, LocationRef, StringRef, Type, AttributeValue._arg_type)

_DefReaderCallback_FP_CartDimension = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, CartDimensionRef, StringRef, ctypes.c_uint32, CartPeriodicity)

_DefReaderCallback_FP_CartTopology = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, CartTopologyRef, StringRef, CommRef, ctypes.c_uint8, ctypes.POINTER(CartDimensionRef))

_DefReaderCallback_FP_CartCoordinate = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, CartTopologyRef, ctypes.c_uint32, ctypes.c_uint8, ctypes.POINTER(ctypes.c_uint32))

_DefReaderCallback_FP_SourceCodeLocation = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, SourceCodeLocationRef, StringRef, ctypes.c_uint32)

_DefReaderCallback_FP_CallingContext = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, CallingContextRef, RegionRef, SourceCodeLocationRef, CallingContextRef)

_DefReaderCallback_FP_CallingContextProperty = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, CallingContextRef, StringRef, Type, AttributeValue._arg_type)

_DefReaderCallback_FP_InterruptGenerator = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, InterruptGeneratorRef, StringRef, InterruptGeneratorMode, Base, ctypes.c_int64, ctypes.c_uint64)

_DefReaderCallback_FP_IoFileProperty = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, IoFileRef, StringRef, Type, AttributeValue._arg_type)

_DefReaderCallback_FP_IoRegularFile = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, IoFileRef, StringRef, SystemTreeNodeRef)

_DefReaderCallback_FP_IoDirectory = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, IoFileRef, StringRef, SystemTreeNodeRef)

_DefReaderCallback_FP_IoHandle = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, IoHandleRef, StringRef, IoFileRef, IoParadigmRef, IoHandleFlag, CommRef, IoHandleRef)

_DefReaderCallback_FP_IoPreCreatedHandleState = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, IoHandleRef, IoAccessMode, IoStatusFlag)

_DefReaderCallback_FP_CallpathParameter = ctypes.CFUNCTYPE(CallbackCode, ctypes.c_void_p, CallpathRef, ParameterRef, Type, AttributeValue._arg_type)

def DefReaderCallbacks_SetUnknownCallback(defReaderCallbacks, unknownCallback):
    c_SetUnknownCallback = conf.lib.OTF2_DefReaderCallbacks_SetUnknownCallback
    c_SetUnknownCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_Unknown ]
    c_SetUnknownCallback.restype = ErrorCode
    c_SetUnknownCallback.errcheck = HandleErrorCode
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_Unknown,
                                         unknownCallback)
    c_SetUnknownCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetMappingTableCallback(defReaderCallbacks, mappingTableCallback):
    c_SetMappingTableCallback = conf.lib.OTF2_DefReaderCallbacks_SetMappingTableCallback
    c_SetMappingTableCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_MappingTable ]
    c_SetMappingTableCallback.restype = ErrorCode
    c_SetMappingTableCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_MappingTable,
                                         mappingTableCallback,
                                         convert)
    c_SetMappingTableCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetClockOffsetCallback(defReaderCallbacks, clockOffsetCallback):
    c_SetClockOffsetCallback = conf.lib.OTF2_DefReaderCallbacks_SetClockOffsetCallback
    c_SetClockOffsetCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_ClockOffset ]
    c_SetClockOffsetCallback.restype = ErrorCode
    c_SetClockOffsetCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_ClockOffset,
                                         clockOffsetCallback,
                                         convert)
    c_SetClockOffsetCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetStringCallback(defReaderCallbacks, stringCallback):
    c_SetStringCallback = conf.lib.OTF2_DefReaderCallbacks_SetStringCallback
    c_SetStringCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_String ]
    c_SetStringCallback.restype = ErrorCode
    c_SetStringCallback.errcheck = HandleErrorCode
    def convert_string(ref, name):
        return ref, str_decode(name)
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_String,
                                         stringCallback, convert_string)
    c_SetStringCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetAttributeCallback(defReaderCallbacks, attributeCallback):
    c_SetAttributeCallback = conf.lib.OTF2_DefReaderCallbacks_SetAttributeCallback
    c_SetAttributeCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_Attribute ]
    c_SetAttributeCallback.restype = ErrorCode
    c_SetAttributeCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_Attribute,
                                         attributeCallback,
                                         convert)
    c_SetAttributeCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetSystemTreeNodeCallback(defReaderCallbacks, systemTreeNodeCallback):
    c_SetSystemTreeNodeCallback = conf.lib.OTF2_DefReaderCallbacks_SetSystemTreeNodeCallback
    c_SetSystemTreeNodeCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_SystemTreeNode ]
    c_SetSystemTreeNodeCallback.restype = ErrorCode
    c_SetSystemTreeNodeCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_SystemTreeNode,
                                         systemTreeNodeCallback,
                                         convert)
    c_SetSystemTreeNodeCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetLocationGroupCallback(defReaderCallbacks, locationGroupCallback):
    c_SetLocationGroupCallback = conf.lib.OTF2_DefReaderCallbacks_SetLocationGroupCallback
    c_SetLocationGroupCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_LocationGroup ]
    c_SetLocationGroupCallback.restype = ErrorCode
    c_SetLocationGroupCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_LocationGroup,
                                         locationGroupCallback,
                                         convert)
    c_SetLocationGroupCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetLocationCallback(defReaderCallbacks, locationCallback):
    c_SetLocationCallback = conf.lib.OTF2_DefReaderCallbacks_SetLocationCallback
    c_SetLocationCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_Location ]
    c_SetLocationCallback.restype = ErrorCode
    c_SetLocationCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_Location,
                                         locationCallback,
                                         convert)
    c_SetLocationCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetRegionCallback(defReaderCallbacks, regionCallback):
    c_SetRegionCallback = conf.lib.OTF2_DefReaderCallbacks_SetRegionCallback
    c_SetRegionCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_Region ]
    c_SetRegionCallback.restype = ErrorCode
    c_SetRegionCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_Region,
                                         regionCallback,
                                         convert)
    c_SetRegionCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetCallsiteCallback(defReaderCallbacks, callsiteCallback):
    c_SetCallsiteCallback = conf.lib.OTF2_DefReaderCallbacks_SetCallsiteCallback
    c_SetCallsiteCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_Callsite ]
    c_SetCallsiteCallback.restype = ErrorCode
    c_SetCallsiteCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_Callsite,
                                         callsiteCallback,
                                         convert)
    c_SetCallsiteCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetCallpathCallback(defReaderCallbacks, callpathCallback):
    c_SetCallpathCallback = conf.lib.OTF2_DefReaderCallbacks_SetCallpathCallback
    c_SetCallpathCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_Callpath ]
    c_SetCallpathCallback.restype = ErrorCode
    c_SetCallpathCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_Callpath,
                                         callpathCallback,
                                         convert)
    c_SetCallpathCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetGroupCallback(defReaderCallbacks, groupCallback):
    c_SetGroupCallback = conf.lib.OTF2_DefReaderCallbacks_SetGroupCallback
    c_SetGroupCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_Group ]
    c_SetGroupCallback.restype = ErrorCode
    c_SetGroupCallback.errcheck = HandleErrorCode
    def convert_group(ref, name, group_type, paradigm, group_flags, number_of_metrics,
                      members_array):
        members = [members_array[i] for i in range(number_of_metrics)]
        return ref, name, group_type, paradigm, group_flags, members
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_Group,
                                         groupCallback, convert_group)
    c_SetGroupCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetMetricMemberCallback(defReaderCallbacks, metricMemberCallback):
    c_SetMetricMemberCallback = conf.lib.OTF2_DefReaderCallbacks_SetMetricMemberCallback
    c_SetMetricMemberCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_MetricMember ]
    c_SetMetricMemberCallback.restype = ErrorCode
    c_SetMetricMemberCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_MetricMember,
                                         metricMemberCallback,
                                         convert)
    c_SetMetricMemberCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetMetricClassCallback(defReaderCallbacks, metricClassCallback):
    c_SetMetricClassCallback = conf.lib.OTF2_DefReaderCallbacks_SetMetricClassCallback
    c_SetMetricClassCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_MetricClass ]
    c_SetMetricClassCallback.restype = ErrorCode
    c_SetMetricClassCallback.errcheck = HandleErrorCode
    def convert_metric_class(ref, number_of_metrics, metric_members_array, metric_occurrence,
                             recorder_kind):
        metric_members = [metric_members_array[i] for i in range(number_of_metrics)]
        return ref, metric_members, metric_occurrence, recorder_kind
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_MetricClass,
                                         metricClassCallback, convert_metric_class)
    c_SetMetricClassCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetMetricInstanceCallback(defReaderCallbacks, metricInstanceCallback):
    c_SetMetricInstanceCallback = conf.lib.OTF2_DefReaderCallbacks_SetMetricInstanceCallback
    c_SetMetricInstanceCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_MetricInstance ]
    c_SetMetricInstanceCallback.restype = ErrorCode
    c_SetMetricInstanceCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_MetricInstance,
                                         metricInstanceCallback,
                                         convert)
    c_SetMetricInstanceCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetCommCallback(defReaderCallbacks, commCallback):
    c_SetCommCallback = conf.lib.OTF2_DefReaderCallbacks_SetCommCallback
    c_SetCommCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_Comm ]
    c_SetCommCallback.restype = ErrorCode
    c_SetCommCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_Comm,
                                         commCallback,
                                         convert)
    c_SetCommCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetParameterCallback(defReaderCallbacks, parameterCallback):
    c_SetParameterCallback = conf.lib.OTF2_DefReaderCallbacks_SetParameterCallback
    c_SetParameterCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_Parameter ]
    c_SetParameterCallback.restype = ErrorCode
    c_SetParameterCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_Parameter,
                                         parameterCallback,
                                         convert)
    c_SetParameterCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetRmaWinCallback(defReaderCallbacks, rmaWinCallback):
    c_SetRmaWinCallback = conf.lib.OTF2_DefReaderCallbacks_SetRmaWinCallback
    c_SetRmaWinCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_RmaWin ]
    c_SetRmaWinCallback.restype = ErrorCode
    c_SetRmaWinCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_RmaWin,
                                         rmaWinCallback,
                                         convert)
    c_SetRmaWinCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetMetricClassRecorderCallback(defReaderCallbacks, metricClassRecorderCallback):
    c_SetMetricClassRecorderCallback = conf.lib.OTF2_DefReaderCallbacks_SetMetricClassRecorderCallback
    c_SetMetricClassRecorderCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_MetricClassRecorder ]
    c_SetMetricClassRecorderCallback.restype = ErrorCode
    c_SetMetricClassRecorderCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_MetricClassRecorder,
                                         metricClassRecorderCallback,
                                         convert)
    c_SetMetricClassRecorderCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetSystemTreeNodePropertyCallback(defReaderCallbacks, systemTreeNodePropertyCallback):
    c_SetSystemTreeNodePropertyCallback = conf.lib.OTF2_DefReaderCallbacks_SetSystemTreeNodePropertyCallback
    c_SetSystemTreeNodePropertyCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_SystemTreeNodeProperty ]
    c_SetSystemTreeNodePropertyCallback.restype = ErrorCode
    c_SetSystemTreeNodePropertyCallback.errcheck = HandleErrorCode
    convert = _convert_property_union
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_SystemTreeNodeProperty,
                                         systemTreeNodePropertyCallback,
                                         convert)
    c_SetSystemTreeNodePropertyCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetSystemTreeNodeDomainCallback(defReaderCallbacks, systemTreeNodeDomainCallback):
    c_SetSystemTreeNodeDomainCallback = conf.lib.OTF2_DefReaderCallbacks_SetSystemTreeNodeDomainCallback
    c_SetSystemTreeNodeDomainCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_SystemTreeNodeDomain ]
    c_SetSystemTreeNodeDomainCallback.restype = ErrorCode
    c_SetSystemTreeNodeDomainCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_SystemTreeNodeDomain,
                                         systemTreeNodeDomainCallback,
                                         convert)
    c_SetSystemTreeNodeDomainCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetLocationGroupPropertyCallback(defReaderCallbacks, locationGroupPropertyCallback):
    c_SetLocationGroupPropertyCallback = conf.lib.OTF2_DefReaderCallbacks_SetLocationGroupPropertyCallback
    c_SetLocationGroupPropertyCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_LocationGroupProperty ]
    c_SetLocationGroupPropertyCallback.restype = ErrorCode
    c_SetLocationGroupPropertyCallback.errcheck = HandleErrorCode
    convert = _convert_property_union
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_LocationGroupProperty,
                                         locationGroupPropertyCallback,
                                         convert)
    c_SetLocationGroupPropertyCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetLocationPropertyCallback(defReaderCallbacks, locationPropertyCallback):
    c_SetLocationPropertyCallback = conf.lib.OTF2_DefReaderCallbacks_SetLocationPropertyCallback
    c_SetLocationPropertyCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_LocationProperty ]
    c_SetLocationPropertyCallback.restype = ErrorCode
    c_SetLocationPropertyCallback.errcheck = HandleErrorCode
    convert = _convert_property_union
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_LocationProperty,
                                         locationPropertyCallback,
                                         convert)
    c_SetLocationPropertyCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetCartDimensionCallback(defReaderCallbacks, cartDimensionCallback):
    c_SetCartDimensionCallback = conf.lib.OTF2_DefReaderCallbacks_SetCartDimensionCallback
    c_SetCartDimensionCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_CartDimension ]
    c_SetCartDimensionCallback.restype = ErrorCode
    c_SetCartDimensionCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_CartDimension,
                                         cartDimensionCallback,
                                         convert)
    c_SetCartDimensionCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetCartTopologyCallback(defReaderCallbacks, cartTopologyCallback):
    c_SetCartTopologyCallback = conf.lib.OTF2_DefReaderCallbacks_SetCartTopologyCallback
    c_SetCartTopologyCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_CartTopology ]
    c_SetCartTopologyCallback.restype = ErrorCode
    c_SetCartTopologyCallback.errcheck = HandleErrorCode
    def convert_cart_topology(ref, name, communicator, number_of_dimensions,
                              cart_dimensions_array):
        cart_dimensions = [cart_dimensions_array[i] for i in range(number_of_dimensions)]
        return ref, name, communicator, cart_dimensions
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_CartTopology,
                                         cartTopologyCallback, convert_cart_topology)
    c_SetCartTopologyCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetCartCoordinateCallback(defReaderCallbacks, cartCoordinateCallback):
    c_SetCartCoordinateCallback = conf.lib.OTF2_DefReaderCallbacks_SetCartCoordinateCallback
    c_SetCartCoordinateCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_CartCoordinate ]
    c_SetCartCoordinateCallback.restype = ErrorCode
    c_SetCartCoordinateCallback.errcheck = HandleErrorCode
    def convert_cart_coordinate(cart_topology, rank, number_of_dimensions, coordinates_array):
        coordinates = [coordinates_array[i] for i in range(number_of_dimensions)]
        return cart_topology, rank, coordinates
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_CartCoordinate,
                                         cartCoordinateCallback, convert_cart_coordinate)
    c_SetCartCoordinateCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetSourceCodeLocationCallback(defReaderCallbacks, sourceCodeLocationCallback):
    c_SetSourceCodeLocationCallback = conf.lib.OTF2_DefReaderCallbacks_SetSourceCodeLocationCallback
    c_SetSourceCodeLocationCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_SourceCodeLocation ]
    c_SetSourceCodeLocationCallback.restype = ErrorCode
    c_SetSourceCodeLocationCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_SourceCodeLocation,
                                         sourceCodeLocationCallback,
                                         convert)
    c_SetSourceCodeLocationCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetCallingContextCallback(defReaderCallbacks, callingContextCallback):
    c_SetCallingContextCallback = conf.lib.OTF2_DefReaderCallbacks_SetCallingContextCallback
    c_SetCallingContextCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_CallingContext ]
    c_SetCallingContextCallback.restype = ErrorCode
    c_SetCallingContextCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_CallingContext,
                                         callingContextCallback,
                                         convert)
    c_SetCallingContextCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetCallingContextPropertyCallback(defReaderCallbacks, callingContextPropertyCallback):
    c_SetCallingContextPropertyCallback = conf.lib.OTF2_DefReaderCallbacks_SetCallingContextPropertyCallback
    c_SetCallingContextPropertyCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_CallingContextProperty ]
    c_SetCallingContextPropertyCallback.restype = ErrorCode
    c_SetCallingContextPropertyCallback.errcheck = HandleErrorCode
    convert = _convert_property_union
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_CallingContextProperty,
                                         callingContextPropertyCallback,
                                         convert)
    c_SetCallingContextPropertyCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetInterruptGeneratorCallback(defReaderCallbacks, interruptGeneratorCallback):
    c_SetInterruptGeneratorCallback = conf.lib.OTF2_DefReaderCallbacks_SetInterruptGeneratorCallback
    c_SetInterruptGeneratorCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_InterruptGenerator ]
    c_SetInterruptGeneratorCallback.restype = ErrorCode
    c_SetInterruptGeneratorCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_InterruptGenerator,
                                         interruptGeneratorCallback,
                                         convert)
    c_SetInterruptGeneratorCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetIoFilePropertyCallback(defReaderCallbacks, ioFilePropertyCallback):
    c_SetIoFilePropertyCallback = conf.lib.OTF2_DefReaderCallbacks_SetIoFilePropertyCallback
    c_SetIoFilePropertyCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_IoFileProperty ]
    c_SetIoFilePropertyCallback.restype = ErrorCode
    c_SetIoFilePropertyCallback.errcheck = HandleErrorCode
    convert = _convert_property_union
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_IoFileProperty,
                                         ioFilePropertyCallback,
                                         convert)
    c_SetIoFilePropertyCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetIoRegularFileCallback(defReaderCallbacks, ioRegularFileCallback):
    c_SetIoRegularFileCallback = conf.lib.OTF2_DefReaderCallbacks_SetIoRegularFileCallback
    c_SetIoRegularFileCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_IoRegularFile ]
    c_SetIoRegularFileCallback.restype = ErrorCode
    c_SetIoRegularFileCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_IoRegularFile,
                                         ioRegularFileCallback,
                                         convert)
    c_SetIoRegularFileCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetIoDirectoryCallback(defReaderCallbacks, ioDirectoryCallback):
    c_SetIoDirectoryCallback = conf.lib.OTF2_DefReaderCallbacks_SetIoDirectoryCallback
    c_SetIoDirectoryCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_IoDirectory ]
    c_SetIoDirectoryCallback.restype = ErrorCode
    c_SetIoDirectoryCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_IoDirectory,
                                         ioDirectoryCallback,
                                         convert)
    c_SetIoDirectoryCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetIoHandleCallback(defReaderCallbacks, ioHandleCallback):
    c_SetIoHandleCallback = conf.lib.OTF2_DefReaderCallbacks_SetIoHandleCallback
    c_SetIoHandleCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_IoHandle ]
    c_SetIoHandleCallback.restype = ErrorCode
    c_SetIoHandleCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_IoHandle,
                                         ioHandleCallback,
                                         convert)
    c_SetIoHandleCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetIoPreCreatedHandleStateCallback(defReaderCallbacks, ioPreCreatedHandleStateCallback):
    c_SetIoPreCreatedHandleStateCallback = conf.lib.OTF2_DefReaderCallbacks_SetIoPreCreatedHandleStateCallback
    c_SetIoPreCreatedHandleStateCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_IoPreCreatedHandleState ]
    c_SetIoPreCreatedHandleStateCallback.restype = ErrorCode
    c_SetIoPreCreatedHandleStateCallback.errcheck = HandleErrorCode
    convert = None
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_IoPreCreatedHandleState,
                                         ioPreCreatedHandleStateCallback,
                                         convert)
    c_SetIoPreCreatedHandleStateCallback(defReaderCallbacks, wrapped_callback)

def DefReaderCallbacks_SetCallpathParameterCallback(defReaderCallbacks, callpathParameterCallback):
    c_SetCallpathParameterCallback = conf.lib.OTF2_DefReaderCallbacks_SetCallpathParameterCallback
    c_SetCallpathParameterCallback.argtypes = [ ctypes.POINTER(DefReaderCallbacks), _DefReaderCallback_FP_CallpathParameter ]
    c_SetCallpathParameterCallback.restype = ErrorCode
    c_SetCallpathParameterCallback.errcheck = HandleErrorCode
    convert = _convert_property_union
    wrapped_callback = _callback_wrapper(_DefReaderCallback_FP_CallpathParameter,
                                         callpathParameterCallback,
                                         convert)
    c_SetCallpathParameterCallback(defReaderCallbacks, wrapped_callback)

__all__ = [
    'DefReaderCallbacks',
    'DefReaderCallbacks_New',
    'DefReaderCallbacks_Delete',
    'DefReaderCallbacks_Clear',
    'DefReaderCallbacks_SetUnknownCallback',
    'DefReaderCallbacks_SetMappingTableCallback',
    'DefReaderCallbacks_SetClockOffsetCallback',
    'DefReaderCallbacks_SetStringCallback',
    'DefReaderCallbacks_SetAttributeCallback',
    'DefReaderCallbacks_SetSystemTreeNodeCallback',
    'DefReaderCallbacks_SetLocationGroupCallback',
    'DefReaderCallbacks_SetLocationCallback',
    'DefReaderCallbacks_SetRegionCallback',
    'DefReaderCallbacks_SetCallsiteCallback',
    'DefReaderCallbacks_SetCallpathCallback',
    'DefReaderCallbacks_SetGroupCallback',
    'DefReaderCallbacks_SetMetricMemberCallback',
    'DefReaderCallbacks_SetMetricClassCallback',
    'DefReaderCallbacks_SetMetricInstanceCallback',
    'DefReaderCallbacks_SetCommCallback',
    'DefReaderCallbacks_SetParameterCallback',
    'DefReaderCallbacks_SetRmaWinCallback',
    'DefReaderCallbacks_SetMetricClassRecorderCallback',
    'DefReaderCallbacks_SetSystemTreeNodePropertyCallback',
    'DefReaderCallbacks_SetSystemTreeNodeDomainCallback',
    'DefReaderCallbacks_SetLocationGroupPropertyCallback',
    'DefReaderCallbacks_SetLocationPropertyCallback',
    'DefReaderCallbacks_SetCartDimensionCallback',
    'DefReaderCallbacks_SetCartTopologyCallback',
    'DefReaderCallbacks_SetCartCoordinateCallback',
    'DefReaderCallbacks_SetSourceCodeLocationCallback',
    'DefReaderCallbacks_SetCallingContextCallback',
    'DefReaderCallbacks_SetCallingContextPropertyCallback',
    'DefReaderCallbacks_SetInterruptGeneratorCallback',
    'DefReaderCallbacks_SetIoFilePropertyCallback',
    'DefReaderCallbacks_SetIoRegularFileCallback',
    'DefReaderCallbacks_SetIoDirectoryCallback',
    'DefReaderCallbacks_SetIoHandleCallback',
    'DefReaderCallbacks_SetIoPreCreatedHandleStateCallback',
    'DefReaderCallbacks_SetCallpathParameterCallback',
]