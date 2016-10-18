#!../../bin/linux-x86_64/thorFW

epicsEnvSet( "STREAM_PROTOCOL_PATH","../../thorFWApp/Db:.")
epicsEnvSet( "DESC","Thorlabs 102C Filter Wheel")

< envPaths

cd ${TOP}

dbLoadDatabase "dbd/thorFW.dbd"
thorFW_registerRecordDeviceDriver pdbbase

epicsEnvSet("P","ESB:THFW01")
epicsEnvSet("PROTOFILE","thorFW.proto")
epicsEnvSet("DELAY1","0.5")

save_restoreSet_status_prefix( "")
save_restoreSet_IncompleteSetsOk( 1)
save_restoreSet_DatedBackupFiles( 1)
set_savefile_path( "/nfs/slac/g/testfac/esb/$(IOC)","autosave")
set_pass0_restoreFile( "thorFW.sav")
set_pass1_restoreFile( "thorFW.sav")

drvAsynIPPortConfigure ("L0","ts-esb-01:2009",0,0,0)

#asynSetTraceMask("L0",-1,0x9)
#asynSetTraceIOMask("L0",-1,0x2)

dbLoadRecords("db/thorFW.db","IOCNAME=${IOC},P=ESB:THFW01,PROTOFILE=$(PROTOFILE),DELAY1=$(DELAY1),PORT=P0,L=L0,A=0,DESC=$(DESC)")

cd ${AUTOSAVE}
dbLoadRecords( "db/save_restoreStatus.db","P=$(P)")

cd ${TOP}/iocBoot/${IOC}
iocInit()

create_monitor_set( "thorFW.req",30,"P=$(P)")

