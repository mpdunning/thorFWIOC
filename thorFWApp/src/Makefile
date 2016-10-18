TOP=../..

include $(TOP)/configure/CONFIG

PROD_IOC = thorFW

DBD += thorFW.dbd

thorFW_DBD += base.dbd
thorFW_DBD += stream.dbd
thorFW_DBD += asyn.dbd
thorFW_DBD += asSupport.dbd
#thorFW_DBD += calcSupport.dbd
thorFW_DBD += drvAsynIPPort.dbd

thorFW_SRCS += thorFW_registerRecordDeviceDriver.cpp
thorFW_SRCS_DEFAULT += thorFWMain.cpp

thorFW_LIBS += asyn
thorFW_LIBS += autosave
thorFW_LIBS += stream
#thorFW_LIBS += calc

thorFW_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES

