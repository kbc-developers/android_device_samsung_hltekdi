/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.
   Copyright (c) 2017, The LineageOS Project. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

#include <cutils/properties.h>
#include "vendor_init.h"
#include "log.h"
#include "util.h"

#include "init_msm8974.h"

void set_rild_libpath(char const *variant)
{
    std::string libpath("/system/vendor/lib/libsec-ril.");
    libpath += variant;
    libpath += ".so";

    property_override("rild.libpath", libpath.c_str());
}

void cdma_properties(char const *operator_alpha,
        char const *operator_numeric,
        char const *default_network,
        char const *cdma_sub,
        char const *rild_lib_variant)
{
    /* Dynamic CDMA Properties */
    property_set("ro.cdma.home.operator.alpha", operator_alpha);
    property_set("ro.cdma.home.operator.numeric", operator_numeric);
    property_set("ro.telephony.default_network", default_network);
    property_set("ro.telephony.default_cdma_sub", cdma_sub);
    set_rild_libpath(rild_lib_variant);

    /* Static CDMA Properties */
    property_set("ril.subscription.types", "NV,RUIM");
    property_set("telephony.lteOnCdmaDevice", "1");
}

#define ISMATCH(a, b) (!strncmp((a), (b), PROP_VALUE_MAX))

void init_target_properties()
{
    char platform[PROP_VALUE_MAX];
    char bootloader[PROP_VALUE_MAX];
    char device[PROP_VALUE_MAX];
    char devicename[PROP_VALUE_MAX];
    int rc;

    rc = property_get("ro.board.platform", platform, NULL);
    if (!rc || !ISMATCH(platform, ANDROID_TARGET))
        return;
        
    property_get("ro.bootloader", bootloader, NULL);

    if (strstr(bootloader, "SCL22")) {

    property_override("ro.build.fingerprint", "KDDI/SCL22/SCL22:5.0/LRX21V/SCL22KDU2GOH7:user/release-keys");
    property_override("ro.build.description", "hltekdi-user 5.0 LRX21V SCL22KDU2GOH7 release-keys");
    property_override("ro.product.model", "SCL22");
    property_override("ro.product.device", "SCL22");
    cdma_properties("KDDI", "44054", "8", "1", "kdi");
    
    }

    property_get("ro.product.device", device, NULL);
    strlcpy(devicename, device, sizeof(devicename));
    ERROR("Found bootloader id %s setting build properties for %s device\n", bootloader, devicename);
}

