		Method (_L02, 0, NotSerialized)	// _Lxx: Level-Triggered GPE
		{
			GPEC = Zero
		}

		Method (_L0D, 0, NotSerialized)	// _Lxx: Level-Triggered GPE
		{
			Notify (\_SB.PCI0.EHC1, 0x02)
			Notify (\_SB.PCI0.EHC2, 0x02)
#ifdef CONFIG_CHIPSET_INTEL_XHC_DEVICE
			Notify (CONFIG_CHIPSET_INTEL_XHC_DEVICE, 0x02)
#endif
			Notify (\_SB.PCI0.HDEF, 0x02)
#ifdef CONFIG_CHIPSET_INTEL_LAN_DEVICE
			Notify (CONFIG_CHIPSET_INTEL_LAN_DEVICE, 0x02)
#endif
		}

		Method (_L1D, 0, NotSerialized)	// _Lxx: Level-Triggered GPE
		{
			Notify (\_SB.PWRB, 0x02)
		}
