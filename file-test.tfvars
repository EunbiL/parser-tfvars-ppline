opco_trigram = "AFA"
########## NETBOX #####################

map_netbox_pref = [
  #{ "pref_desc" = "GEP_AAS_SUMMARY_02",         "prefix" = "10.224.0.0/19" },
  #{ "pref_desc" = "GEP_AAS_PROD_INT_PIC_02_LS", "prefix" = "10.224.0.0/23" },
  #{ "pref_desc" = "GEP_AAS_PROD_INT_SEC_02",    "prefix" = "10.224.2.0/23" },
  #{ "pref_desc" = "GEP_AAS_PROD_EXT_PICSEC_02", "prefix" = "10.224.4.0/22" },
  { "pref_desc" = "GEP_AFA_PROD_INT_SRV_02_LS", "prefix" = "10.224.8.0/24" },
  { "pref_desc" = "GEP_AFA_PROD_EXT_SRV_02_LS", "prefix" = "10.224.9.0/24" },
  #{ "pref_desc" = "GEP_AAS_PPRD_INT_PIC_02_LS", "prefix" = "10.224.10.0/23" },
  #{ "pref_desc" = "GEP_AAS_PPRD_INT_SEC_02",    "prefix" = "10.224.12.0/23" },
  { "pref_desc" = "GEP_AFA_PPRD_INT_SRV_02_LS", "prefix" = "10.224.14.0/24" },
  { "pref_desc" = "GEP_AFA_PPRD_EXT_SRV_02_LS", "prefix" = "10.224.15.0/24" },
  #{ "pref_desc" = "GEP_AAS_PPRD_EXT_PICSEC_02", "prefix" = "10.224.16.0/22" },
  #{ "pref_desc" = "GEP_AAS_DEVS_INT_02_LS",     "prefix" = "10.224.20.0/24" },
  #{ "pref_desc" = "GEP_AAS_DEVS_EXT_02_LS",     "prefix" = "10.224.21.0/24" },
  { "pref_desc" = "GEP_AFA_DEVS_SRV_02_LS",     "prefix" = "10.224.22.0/24" },
  #{ "pref_desc" = "GEP_AAS_DEVT_INT_02_LS",     "prefix" = "10.224.23.0/24" },
  #{ "pref_desc" = "GEP_AAS_DEVT_EXT_02_LS",     "prefix" = "10.224.24.0/24" },
  { "pref_desc" = "GEP_AFA_DEVT_SRV_02_LS",     "prefix" = "10.224.25.0/24" },
] 

TZ = {
  tz_set = ["overlay-tz-frlow01v1001.wwmgmt.intraxa", "VCF-edge_fr00-w01clu-ec_uplink-tz","EDGE-BRIDGE-VLAN-TZ"]
}

EC = {
  ec_set = ["GEP-GRT-DAT-01-EC"]
}

EN = {
  frlow01v8005 = "GEP-GRT-DAT-01-EC"
  frlow01v8006 = "GEP-GRT-DAT-01-EC"
}

T0 = {
  t0_set = ["GEP_GRT_DAT_01_T0"]
}

map_t0 = {
  GEP_AFA_DAT_01_T0 = { edgecluster = "GEP-GRT-DAT-01-EC", failover_mode = "NON_PREEMPTIVE", enable_firewall = true, ha_mode = "ACTIVE_ACTIVE", local_as_num = "", gateway_path = "GEP_GRT_DAT_01_T0", bgp_enabled = "true", redistrib = ["TIER1_CONNECTED", "TIER1_SEGMENT"] }
}

map_t0_int = {
  GEP_T0_AFA_frlow01v8005_UP01 = { type = "EXTERNAL", subnets = ["10.227.32.100/29"], t0 = "GEP_AFA_DAT_01_T0", segment = "GEP_GRT_DAT_TRUNK_UP01_LS", edge = "frlow01v8005", access_vlan_id = "1942", vrf = true, urpf = "" }
  GEP_T0_AFA_frlow01v8005_UP02 = { type = "EXTERNAL", subnets = ["10.227.32.108/29"], t0 = "GEP_AFA_DAT_01_T0", segment = "GEP_GRT_DAT_TRUNK_UP02_LS", edge = "frlow01v8005", access_vlan_id = "1943", vrf = true, urpf = "" }
  GEP_T0_AFA_frlow01v8006_UP01 = { type = "EXTERNAL", subnets = ["10.227.32.99/29"], t0 = "GEP_AFA_DAT_01_T0", segment = "GEP_GRT_DAT_TRUNK_UP01_LS", edge = "frlow01v8006", access_vlan_id = "1942", vrf = true, urpf = "" }
  GEP_T0_AFA_frlow01v8006_UP02 = { type = "EXTERNAL", subnets = ["10.227.32.107/29"], t0 = "GEP_AFA_DAT_01_T0", segment = "GEP_GRT_DAT_TRUNK_UP02_LS", edge = "frlow01v8006", access_vlan_id = "1943", vrf = true, urpf = "" }
}

map_bgp_neighbor = {
  SE212-HT-SCP-01_AFA_1942 = { t0 = "GEP_AFA_DAT_01_T0", source_addresses = ["10.227.32.100", "10.227.32.99"], remote_as_num = "65086", neighbor_address = "10.227.32.98", vrf = true }
  SE302-HT-SCP-01_AFA_1942 = { t0 = "GEP_AFA_DAT_01_T0", source_addresses = ["10.227.32.100", "10.227.32.99"], remote_as_num = "65086", neighbor_address = "10.227.32.97", vrf = true }
  SE212-HT-SCP-02_AFA_1943 = { t0 = "GEP_AFA_DAT_01_T0", source_addresses = ["10.227.32.108", "10.227.32.107"], remote_as_num = "65086", neighbor_address = "10.227.32.106", vrf = true }
  SE302-HT-SCP-02_AFA_1943 = { t0 = "GEP_AFA_DAT_01_T0", source_addresses = ["10.227.32.108", "10.227.32.107"], remote_as_num = "65086", neighbor_address = "10.227.32.105", vrf = true }

}


map_t1 = {
  GEP_AFA_DAT_01_T1 = { edgecluster = "", t0 = "GEP_AFA_DAT_01_T0", failover_mode = "NON_PREEMPTIVE", vrf = true }
}

map_segments_overlay = {
  GEP_AFA_SYNC_LS            = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP", "SYNC", "AFA"], connectivity = "OFF" }
  GEP_AFA_SYNC_02_LS         = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP", "SYNC", "AFA", "GRN"], connectivity = "OFF" }
  GEP_AFA_PROD_INT_PIC_02_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = ["10.224.0.1/23"], tags = ["AFA", "PROD", "PIC", "INT", "GEP", "GRN"], connectivity = "ON" }
  GEP_AFA_PROD_INT_SRV_02_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = ["10.224.8.1/24"], tags = ["AFA", "PROD", "SRV", "INT", "GEP", "GRN"], connectivity = "ON" }
  GEP_AFA_PROD_EXT_SRV_02_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = ["10.224.9.1/24"], tags = ["AFA", "PROD", "SRV", "EXT", "GEP", "GRN"], connectivity = "ON" }

  GEP_AFA_PPRD_INT_PIC_02_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = ["10.224.10.1/23"], tags = ["AFA", "PPRD", "PIC", "INT", "GEP", "GRN"], connectivity = "ON" }
  GEP_AFA_PPRD_INT_SRV_02_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = ["10.224.14.1/24"], tags = ["AFA", "PPRD", "SRV", "INT", "GEP", "GRN"], connectivity = "ON" }
  GEP_AFA_PPRD_EXT_SRV_02_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = ["10.224.15.1/24"], tags = ["AFA", "PPRD", "SRV", "EXT", "GEP", "GRN"], connectivity = "ON" }

  GEP_AFA_DEVS_INT_02_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = ["10.224.20.1/24"], tags = ["AFA", "DEVS", "INT", "GEP", "GRN"], connectivity = "ON" }
  GEP_AFA_DEVS_EXT_02_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = ["10.224.21.1/24"], tags = ["AFA", "DEVS", "EXT", "GEP", "GRN"], connectivity = "ON" }
  GEP_AFA_DEVS_SRV_02_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = ["10.224.22.1/24"], tags = ["AFA", "DEVS", "SRV", "GEP", "GRN"], connectivity = "ON" }

  GEP_AFA_DEVT_INT_02_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = ["10.224.23.1/24"], tags = ["AFA", "DEVT", "INT", "GEP", "GRN"], connectivity = "ON" }
  GEP_AFA_DEVT_EXT_02_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = ["10.224.24.1/24"], tags = ["AFA", "DEVT", "EXT", "GEP", "GRN"], connectivity = "ON" }
  GEP_AFA_DEVT_SRV_02_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = ["10.224.25.1/24"], tags = ["AFA", "DEVT", "SRV", "GEP", "GRN"], connectivity = "ON" }
}

map_segments_overlay_bridged = {
  #GEP_AFA_DEVS_SRV_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "GEP_AFA_DAT_01_T1", cidr = [], tags = ["AFA","DEVS","SRV"], connectivity = "ON", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["208"] },
  GEP_AFA_PROD_INT_SRV_LS  = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "PROD", "INT", "SRV","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["204"] }
  GEP_AFA_PROD_EXT_SRV_LS  = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "PROD", "EXT", "SRV","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["205"] }
  GEP_AFA_PPRD_INT_SRV_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "PPRD", "INT", "SRV","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["206"] }
  GEP_AFA_PPRD_EXT_SRV_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "PPRD", "EXT", "SRV","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["207"] }
  GEP_AFA_DEVS_SRV_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "DEVS", "SRV","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["208"] }
  GEP_AFA_DEVT_SRV_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "DEVT", "SRV","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["209"] }
  GEP_AFA_DEVS_INT_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "DEVS", "INT","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["380"] }
  GEP_AFA_PPRD_INT_PIC_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "PPRD", "INT","PIC","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["303"] }
  GEP_AFA_PROD_INT_PIC_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "PROD", "INT","PIC","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["211"] }
  GEP_AFA_DEVT_INT_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "DEVT", "INT","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["381"] }
  GEP_AFA_DEVS_EXT_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "DEVS", "EXT","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["382"] }
  GEP_AFA_DEVT_EXT_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "DEVT", "EXT","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["383"] }
  #GEP_AFA_PROD_INT_SRV_LS  = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "PROD", "INT", "SRV","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["204"] }
  #GEP_AFA_PPRD_INT_SRV_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "PPRD", "INT", "SRV","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["206"] }
  #GEP_AFA_DEVS_SRV_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "DEVS", "SRV","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["208"] }
  #GEP_AFA_DEVT_SRV_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "DEVT", "SRV","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["209"] }
  #GEP_AFA_DEVS_INT_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "DEVS", "INT","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["380"] }
  #GEP_AFA_PPRD_INT_PIC_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "PPRD", "INT","PIC","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["303"] }
  #GEP_AFA_PROD_INT_PIC_LS     = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = [], tags = ["GEP","AFA", "PROD", "INT","PIC","BRN"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["211"] }
  }

map_segment_overlay_bridged_dynamic  = {
  #GEP_ZS1_PPRD_EXT_C_0F1013_PAD_LS016 = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.183.113.161/28"], tags = ["asz:C_0F1013_PAD", "env:PPRD", "pod:GEP", "exposure:EXT", "opco:ZS1", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "", TZB = "", vlan_ids = [""] },
  GEP_AFA_PPRD_EXT_S_042_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.43.225/27"], tags = ["asz:S_042_PAD", "env:PPRD", "pod:GEP", "exposure:EXT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["239"] },
  GEP_AFA_PPRD_EXT_S_047_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.43.33/28"], tags = ["asz:S_047_PAD", "env:PPRD", "pod:GEP", "exposure:EXT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["236"] },
  GEP_AFA_PPRD_INT_S_07A_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.143.144.209/28"], tags = ["asz:S_07A_PAD", "env:PPRD", "pod:GEP", "exposure:INT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["2841"] },
  GEP_AFA_PPRD_INT_S_03C_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.42.129/28"], tags = ["asz:S_03C_PAD", "env:PPRD", "pod:GEP", "exposure:INT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["235"] },
 GEP_AFA_PPRD_INT_S_03D_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.42.145/28"], tags = ["asz:S_03D_PAD", "env:PPRD", "pod:GEP", "exposure:INT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["256"] },
 GEP_AFA_PPRD_INT_S_065_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.143.144.65/28"], tags = ["asz:S_065_PAD", "env:PPRD", "pod:GEP", "exposure:INT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["345"] },
 GEP_AFA_PPRD_EXT_C_066_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.41.145/28"], tags = ["asz:C_066_PAD", "env:PPRD", "pod:GEP", "exposure:EXT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["347"] },
 GEP_AFA_PPRD_EXT_S_055_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.43.49/28"], tags = ["asz:S_055_PAD", "env:PPRD", "pod:GEP", "exposure:EXT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["247"] },
 GEP_AFA_PPRD_INT_S_057_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.42.81/28"], tags = ["asz:S_057_PAD", "env:PPRD", "pod:GEP", "exposure:INT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["248"] },
GEP_AFA_PPRD_INT_S_060_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.143.144.17/28"], tags = ["asz:S_060_PAD", "env:PPRD", "pod:GEP", "exposure:INT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["327"] },
GEP_AFA_PROD_EXT_S_05A_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.26.1/27"], tags = ["asz:S_05A_PAD", "env:PROD", "pod:GEP", "exposure:EXT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["215"] },
GEP_AFA_PROD_EXT_S_067_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.27.78/28"], tags = ["asz:S_067_PAD", "env:PROD", "pod:GEP", "exposure:EXT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["231"] },
GEP_AFA_PPRD_EXT_C_06B_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.41.206/28"], tags = ["asz:C_06B_PAD", "env:PPRD", "pod:GEP", "exposure:EXT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["318"] },
GEP_AFA_PPRD_EXT_S_059_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.43.78/28"], tags = ["asz:S_059_PAD", "env:PPRD", "pod:GEP", "exposure:EXT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["255"] },
GEP_AFA_PPRD_INT_S_06F_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.143.144.174/28"], tags = ["asz:S_06F_PAD", "env:PPRD", "pod:GEP", "exposure:INT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["2849"] },
GEP_AFA_PROD_EXT_C_0C0_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.22.110/28"], tags = ["asz:C_0C0_PAD", "env:PROD", "pod:GEP", "exposure:EXT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["2838"] },
GEP_AFA_PPRD_INT_S_03E_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.42.161/28"], tags = ["asz:S_03E_PAD", "env:PPRD", "pod:GEP", "exposure:INT", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["213"] },
GEP_AFA_PPRD_EXT_S_063_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.43.94/28"], tags = ["asz:S_063_PAD", "env:PPRD", "pod:GEP", "exposure:EXT", "data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["319"] },
GEP_AFA_PPRD_INT_S_043_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.42.225/27"], tags = ["asz:S_043_PAD", "env:PPRD", "pod:GEP", "exposure:INT", "data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["339"] },
GEP_AFA_PROD_EXT_C_0A8_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.21.222/28"], tags = ["asz:C_0A8_PAD", "env:PROD", "pod:GEP", "exposure:EXT", "data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["2890"] },
GEP_AFA_PROD_EXT_S_090_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.143.132.14/28"], tags = ["asz:S_090_PAD", "env:PROD", "pod:GEP", "exposure:EXT", "data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["343"] },
GEP_AFA_PROD_INT_S_08F_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.24.190/27"], tags = ["asz:S_08F_PAD", "env:PROD", "pod:GEP", "exposure:INT", "data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["341"] },
GEP_AFA_PROD_INT_S_0A9_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.143.128.62/28"], tags = ["asz:S_0A9_PAD", "env:PROD", "pod:GEP", "exposure:INT", "data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["2892"] },
GEP_AFA_PPRD_INT_S_064_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.143.144.62/28"], tags = ["asz:S_064_PAD", "env:PPRD", "pod:GEP", "exposure:INT", "data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["323"] },
GEP_AFA_PPRD_EXT_C_073_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.40.190/27"], tags = ["asz:C_073_PAD", "env:PPRD", "pod:GEP", "exposure:EXT", "data-classification:C","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["2894"] },
GEP_AFA_PROD_EXT_S_085_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.26.62/27"], tags = ["asz:S_085_PAD", "env:PROD", "pod:GEP", "exposure:EXT", "data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["316"] },
GEP_AFA_PROD_INT_S_05E_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.24.254/26"], tags = ["asz:S_05E_PAD", "env:PROD", "pod:GEP", "exposure:INT", "data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["344"] },
GEP_AFA_PPRD_INT_S_068_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.143.144.110/28"], tags = ["asz:S_068_PAD", "env:PPRD", "pod:GEP", "exposure:INT","data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["310"] },
GEP_AFA_PROD_INT_S_05F_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.24.94/27"], tags = ["asz:S_05F_PAD", "env:PROD", "pod:GEP", "exposure:INT", "data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["217"] },
GEP_AFA_PROD_INT_S_054_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.25.81/28"], tags = ["asz:S_054_PAD", "env:PROD", "pod:GEP", "exposure:INT", "data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["233"] },
GEP_AFA_PROD_INT_S_08B_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.24.158/27"], tags = ["asz:S_08B_PAD", "env:PROD", "pod:GEP", "exposure:INT", "data-classification:SEC","opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/GEP-GRT-DAT-99-EBP-2", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = ["333"] },
GEP_AFA_PROD_EXT_C_0B8_PAD_LS = { TZ = "overlay-tz-frlow01v1001.wwmgmt.intraxa", T1 = "", cidr = ["10.226.16.158/27"], tags = ["asz:C_0B8_PAD", "env:PROD", "pod:GEP", "exposure:EXT", "data-classification:C", "opco:AFA", "infra:BRN", "usage:VM"], connectivity = "OFF", profile_path = "", TZB = "EDGE-BRIDGE-VLAN-TZ", vlan_ids = [] },

}

map_segments_vlan = {
}

map_srv_int = {
}
