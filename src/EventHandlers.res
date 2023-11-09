let globalEventsSummaryKey = "GlobalEventsSummary"

module BigInt = Ethers.BigInt

let initialEventsSummary: Types.eventsSummaryEntity = {
  id: globalEventsSummaryKey,
  addInboundProofLibraryForChainsCount: BigInt.fromInt(0),
  appConfigUpdatedsCount: BigInt.fromInt(0),
  enableSupportedOutboundProofsCount: BigInt.fromInt(0),
  hashReceivedsCount: BigInt.fromInt(0),
  invalidDstsCount: BigInt.fromInt(0),
  ownershipTransferredsCount: BigInt.fromInt(0),
  packetsCount: BigInt.fromInt(0),
  packetReceivedsCount: BigInt.fromInt(0),
  relayerParamssCount: BigInt.fromInt(0),
  setChainAddressSizesCount: BigInt.fromInt(0),
  setDefaultAdapterParamsForChainIdsCount: BigInt.fromInt(0),
  setDefaultConfigForChainIdsCount: BigInt.fromInt(0),
  setLayerZeroTokensCount: BigInt.fromInt(0),
  setRemoteUlnsCount: BigInt.fromInt(0),
  setTreasurysCount: BigInt.fromInt(0),
  withdrawNativesCount: BigInt.fromInt(0),
  withdrawZROsCount: BigInt.fromInt(0),
}

Handlers.UltraLightNodeV2Contract.AddInboundProofLibraryForChain.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.AddInboundProofLibraryForChain.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    addInboundProofLibraryForChainsCount: currentSummaryEntity.addInboundProofLibraryForChainsCount->BigInt.add(
      BigInt.fromInt(1),
    ),
  }

  let addInboundProofLibraryForChainEntity: Types.addInboundProofLibraryForChainEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    chainId_: event.params.chainId,
    lib: event.params.lib->Ethers.ethAddressToString,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.addInboundProofLibraryForChain.set(addInboundProofLibraryForChainEntity)
})

Handlers.UltraLightNodeV2Contract.AppConfigUpdated.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.AppConfigUpdated.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    appConfigUpdatedsCount: currentSummaryEntity.appConfigUpdatedsCount->BigInt.add(
      BigInt.fromInt(1),
    ),
  }

  let appConfigUpdatedEntity: Types.appConfigUpdatedEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    userApplication: event.params.userApplication->Ethers.ethAddressToString,
    configType: event.params.configType,
    newConfig: event.params.newConfig,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.appConfigUpdated.set(appConfigUpdatedEntity)
})

Handlers.UltraLightNodeV2Contract.EnableSupportedOutboundProof.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.EnableSupportedOutboundProof.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    enableSupportedOutboundProofsCount: currentSummaryEntity.enableSupportedOutboundProofsCount->BigInt.add(
      BigInt.fromInt(1),
    ),
  }

  let enableSupportedOutboundProofEntity: Types.enableSupportedOutboundProofEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    chainId_: event.params.chainId,
    proofType: event.params.proofType,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.enableSupportedOutboundProof.set(enableSupportedOutboundProofEntity)
})

Handlers.UltraLightNodeV2Contract.HashReceived.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.HashReceived.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    hashReceivedsCount: currentSummaryEntity.hashReceivedsCount->BigInt.add(BigInt.fromInt(1)),
  }

  let hashReceivedEntity: Types.hashReceivedEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    srcChainId: event.params.srcChainId,
    oracle: event.params.oracle->Ethers.ethAddressToString,
    lookupHash: event.params.lookupHash,
    blockData: event.params.blockData,
    confirmations: event.params.confirmations,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.hashReceived.set(hashReceivedEntity)
})

Handlers.UltraLightNodeV2Contract.InvalidDst.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.InvalidDst.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    invalidDstsCount: currentSummaryEntity.invalidDstsCount->BigInt.add(BigInt.fromInt(1)),
  }

  let invalidDstEntity: Types.invalidDstEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    srcChainId: event.params.srcChainId,
    srcAddress: event.params.srcAddress,
    dstAddress: event.params.dstAddress->Ethers.ethAddressToString,
    nonce: event.params.nonce,
    payloadHash: event.params.payloadHash,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.invalidDst.set(invalidDstEntity)
})

Handlers.UltraLightNodeV2Contract.OwnershipTransferred.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.OwnershipTransferred.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    ownershipTransferredsCount: currentSummaryEntity.ownershipTransferredsCount->BigInt.add(
      BigInt.fromInt(1),
    ),
  }

  let ownershipTransferredEntity: Types.ownershipTransferredEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    previousOwner: event.params.previousOwner->Ethers.ethAddressToString,
    newOwner: event.params.newOwner->Ethers.ethAddressToString,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.ownershipTransferred.set(ownershipTransferredEntity)
})

Handlers.UltraLightNodeV2Contract.Packet.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.Packet.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    packetsCount: currentSummaryEntity.packetsCount->BigInt.add(BigInt.fromInt(1)),
  }

  let packetEntity: Types.packetEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    payload: event.params.payload,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.packet.set(packetEntity)
})

Handlers.UltraLightNodeV2Contract.PacketReceived.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.PacketReceived.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    packetReceivedsCount: currentSummaryEntity.packetReceivedsCount->BigInt.add(BigInt.fromInt(1)),
  }

  let packetReceivedEntity: Types.packetReceivedEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    srcChainId: event.params.srcChainId,
    srcAddress: event.params.srcAddress,
    dstAddress: event.params.dstAddress->Ethers.ethAddressToString,
    nonce: event.params.nonce,
    payloadHash: event.params.payloadHash,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.packetReceived.set(packetReceivedEntity)
})

Handlers.UltraLightNodeV2Contract.RelayerParams.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.RelayerParams.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    relayerParamssCount: currentSummaryEntity.relayerParamssCount->BigInt.add(BigInt.fromInt(1)),
  }

  let relayerParamsEntity: Types.relayerParamsEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    adapterParams: event.params.adapterParams,
    outboundProofType: event.params.outboundProofType,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.relayerParams.set(relayerParamsEntity)
})

Handlers.UltraLightNodeV2Contract.SetChainAddressSize.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.SetChainAddressSize.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    setChainAddressSizesCount: currentSummaryEntity.setChainAddressSizesCount->BigInt.add(
      BigInt.fromInt(1),
    ),
  }

  let setChainAddressSizeEntity: Types.setChainAddressSizeEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    chainId_: event.params.chainId,
    size: event.params.size,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.setChainAddressSize.set(setChainAddressSizeEntity)
})

Handlers.UltraLightNodeV2Contract.SetDefaultAdapterParamsForChainId.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.SetDefaultAdapterParamsForChainId.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    setDefaultAdapterParamsForChainIdsCount: currentSummaryEntity.setDefaultAdapterParamsForChainIdsCount->BigInt.add(
      BigInt.fromInt(1),
    ),
  }

  let setDefaultAdapterParamsForChainIdEntity: Types.setDefaultAdapterParamsForChainIdEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    chainId_: event.params.chainId,
    proofType: event.params.proofType,
    adapterParams: event.params.adapterParams,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.setDefaultAdapterParamsForChainId.set(setDefaultAdapterParamsForChainIdEntity)
})

Handlers.UltraLightNodeV2Contract.SetDefaultConfigForChainId.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.SetDefaultConfigForChainId.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    setDefaultConfigForChainIdsCount: currentSummaryEntity.setDefaultConfigForChainIdsCount->BigInt.add(
      BigInt.fromInt(1),
    ),
  }

  let setDefaultConfigForChainIdEntity: Types.setDefaultConfigForChainIdEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    chainId_: event.params.chainId,
    inboundProofLib: event.params.inboundProofLib,
    inboundBlockConfirm: event.params.inboundBlockConfirm,
    relayer: event.params.relayer->Ethers.ethAddressToString,
    outboundProofType: event.params.outboundProofType,
    outboundBlockConfirm: event.params.outboundBlockConfirm,
    oracle: event.params.oracle->Ethers.ethAddressToString,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.setDefaultConfigForChainId.set(setDefaultConfigForChainIdEntity)
})

Handlers.UltraLightNodeV2Contract.SetLayerZeroToken.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.SetLayerZeroToken.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    setLayerZeroTokensCount: currentSummaryEntity.setLayerZeroTokensCount->BigInt.add(
      BigInt.fromInt(1),
    ),
  }

  let setLayerZeroTokenEntity: Types.setLayerZeroTokenEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    tokenAddress: event.params.tokenAddress->Ethers.ethAddressToString,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.setLayerZeroToken.set(setLayerZeroTokenEntity)
})

Handlers.UltraLightNodeV2Contract.SetRemoteUln.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.SetRemoteUln.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    setRemoteUlnsCount: currentSummaryEntity.setRemoteUlnsCount->BigInt.add(BigInt.fromInt(1)),
  }

  let setRemoteUlnEntity: Types.setRemoteUlnEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    chainId_: event.params.chainId,
    uln: event.params.uln,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.setRemoteUln.set(setRemoteUlnEntity)
})

Handlers.UltraLightNodeV2Contract.SetTreasury.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.SetTreasury.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    setTreasurysCount: currentSummaryEntity.setTreasurysCount->BigInt.add(BigInt.fromInt(1)),
  }

  let setTreasuryEntity: Types.setTreasuryEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    treasuryAddress: event.params.treasuryAddress->Ethers.ethAddressToString,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.setTreasury.set(setTreasuryEntity)
})

Handlers.UltraLightNodeV2Contract.WithdrawNative.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.WithdrawNative.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    withdrawNativesCount: currentSummaryEntity.withdrawNativesCount->BigInt.add(BigInt.fromInt(1)),
  }

  let withdrawNativeEntity: Types.withdrawNativeEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    msgSender: event.params.msgSender->Ethers.ethAddressToString,
    to: event.params.to->Ethers.ethAddressToString,
    amount: event.params.amount,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.withdrawNative.set(withdrawNativeEntity)
})

Handlers.UltraLightNodeV2Contract.WithdrawZRO.loader((~event, ~context) => {
  context.eventsSummary.load(globalEventsSummaryKey)
})

Handlers.UltraLightNodeV2Contract.WithdrawZRO.handler((~event, ~context) => {
  let summary = context.eventsSummary.get(globalEventsSummaryKey)

  let currentSummaryEntity = summary->Belt.Option.getWithDefault(initialEventsSummary)

  let nextSummaryEntity = {
    ...currentSummaryEntity,
    withdrawZROsCount: currentSummaryEntity.withdrawZROsCount->BigInt.add(BigInt.fromInt(1)),
  }

  let withdrawZROEntity: Types.withdrawZROEntity = {
    id: event.transactionHash ++ event.logIndex->Belt.Int.toString,
    msgSender: event.params.msgSender->Ethers.ethAddressToString,
    to: event.params.to->Ethers.ethAddressToString,
    amount: event.params.amount,
    eventsSummary: globalEventsSummaryKey,
  }

  context.eventsSummary.set(nextSummaryEntity)
  context.withdrawZRO.set(withdrawZROEntity)
})
