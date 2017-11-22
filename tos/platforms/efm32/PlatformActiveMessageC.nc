/**
 * Default radio for the platform, same solution as PlatformSerialC.
 * @author Raido Pahtma
 */
#include <RadioConfig.h> // TRadio
configuration PlatformActiveMessageC {
	provides {
		interface SplitControl;

		interface AMSend[am_id_t id];
		interface Receive[am_id_t id];
		interface Receive as Snoop[am_id_t id];
		interface SendNotifier[am_id_t id];
		interface Packet;
		interface AMPacket;

		interface PacketAcknowledgements;
		interface LowPowerListening;
		interface PacketLink;
		interface RadioChannel;

		interface PacketField<uint8_t> as PacketLinkQuality;
		interface PacketField<uint8_t> as PacketTransmitPower;
		interface PacketField<int8_t> as PacketRSSI;
		interface LinkPacketMetadata;

		interface LocalTime<TRadio> as LocalTimeRadio;
		interface PacketTimeStamp<TRadio, uint32_t> as PacketTimeStampRadio;
		interface PacketTimeStamp<TMilli, uint32_t> as PacketTimeStampMilli;
	}
}
implementation {

	components SLActiveMessageC as PlatformAM;

	SplitControl = PlatformAM;

	AMSend = PlatformAM.AMSend;
	Receive = PlatformAM.Receive;
	Snoop = PlatformAM.Snoop;
	SendNotifier = PlatformAM;
	Packet = PlatformAM.Packet;
	AMPacket = PlatformAM.AMPacket;

	PacketAcknowledgements = PlatformAM;
	LowPowerListening = PlatformAM;
	PacketLink = PlatformAM;
	RadioChannel = PlatformAM;

	PacketLinkQuality = PlatformAM.PacketLinkQuality;
	PacketTransmitPower = PlatformAM.PacketTransmitPower;
	PacketRSSI = PlatformAM.PacketRSSI;
	LinkPacketMetadata = PlatformAM;

	LocalTimeRadio = PlatformAM;
	PacketTimeStampMilli = PlatformAM;
	PacketTimeStampRadio = PlatformAM;
}
