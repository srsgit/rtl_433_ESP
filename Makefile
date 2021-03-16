SRC_DIR = rtl_433

DST_DIR = include

SRC_LIST = abuf.c bitbuffer.c decoder_util.c list.c r_util.c util.c devices/acurite.c \
devices/akhan_100F14.c devices/alecto.c devices/ambientweather_tx8300.c devices/auriol_afw2a1.c \
devices/auriol_hg02832.c devices/blueline.c devices/blyss.c devices/brennenstuhl_rcs_2044.c \
devices/bresser_3ch.c devices/bt_rain.c devices/burnhardbbq.c devices/calibeur.c devices/cardin.c \
devices/chuango.c devices/companion_wtr001.c devices/digitech_xc0324.c devices/dish_remote_6_3.c \
devices/ecowitt.c devices/efth800.c devices/elro_db286a.c devices/elv.c devices/esperanza_ews.c \
devices/eurochron.c devices/fineoffset.c devices/fineoffset_wh1050.c devices/fineoffset_wh1080.c \
devices/fs20.c devices/ft004b.c devices/generic_motion.c devices/generic_remote.c \
devices/generic_temperature_sensor.c devices/gt_tmbbq05.c devices/gt_wt_02.c devices/gt_wt_03.c \
devices/hcs200.c devices/honeywell_wdb.c devices/ht680.c devices/infactory.c devices/inovalley-kw9015b.c \
devices/interlogix.c devices/intertechno.c devices/kedsum.c devices/kerui.c devices/lacrosse.c \
devices/lacrosse_tx141x.c devices/lacrosse_ws7000.c devices/lacrossews.c devices/lightwave_rf.c \
devices/maverick_et73.c devices/mebus.c devices/missil_ml0757.c devices/new_template.c \
devices/newkaku.c devices/nexa.c devices/nexus.c devices/nice_flor_s.c devices/opus_xt300.c \
devices/oregon_scientific_sl109h.c devices/oregon_scientific_v1.c devices/philips_aj3650.c \
devices/philips_aj7010.c devices/prologue.c devices/proove.c devices/quhwa.c devices/rftech.c \
devices/rubicson.c devices/rubicson_48659.c devices/s3318p.c devices/silvercrest.c \
devices/smoke_gs558.c devices/solight_te44.c devices/springfield.c \
devices/tfa_30_3221.c devices/tfa_drop_30.3233.c devices/tfa_pool_thermometer.c \
devices/tfa_twin_plus_30.3049.c devices/thermopro_tp11.c devices/thermopro_tp12.c \
devices/thermopro_tx2.c devices/ts_ft002.c devices/visonic_powercode.c devices/waveman.c \
devices/wg_pb12v1.c devices/ws2032.c devices/wssensor.c devices/wt0124.c devices/x10_rf.c \
devices/x10_sec.c

INCLUDE_FILES = include/abuf.h include/am_analyze.h include/baseband.h include/bitbuffer.h \
include/compat_time.h include/decoder.h include/decoder_util.h include/fatal.h include/fileformat.h \
include/list.h include/optparse.h include/pulse_demod.h include/r_api.h include/r_util.h \
include/samp_grab.h include/term_ctl.h include/util.h 

rtl_433/include:
	git submodule update --init rtl_433

INC_FILES = $(foreach file,$(INCLUDE_FILES),$(file))

SRC_FILES = $(foreach file,$(SRC_LIST),src/rtl_433/$(file))

.PHONY: all clean copy update release

all:	$(MAKE) -e copy

copy: $(INC_FILES)

$(INCLUDE_FILES): 
	@mkdir -p $(@D)
	cp rtl_433/$@ $@
