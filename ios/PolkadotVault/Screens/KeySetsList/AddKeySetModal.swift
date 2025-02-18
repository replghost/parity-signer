//
//  AddKeySetModal.swift
//  Polkadot Vault
//
//  Created by Krzysztof Rodak on 24/08/2022.
//

import SwiftUI

struct AddKeySetModal: View {
    @Binding var isShowingNewSeedMenu: Bool
    @Binding var shouldShowCreateKeySet: Bool
    @Binding var shouldShowRecoverKeySet: Bool
    @State private var animateBackground: Bool = false

    var body: some View {
        FullScreenRoundedModal(
            backgroundTapAction: { animateDismissal() },
            animateBackground: $animateBackground,
            content: {
                VStack(alignment: .leading) {
                    Localizable.AddKeySet.title.text
                        .foregroundColor(Asset.textAndIconsSecondary.swiftUIColor)
                        .font(PrimaryFont.titleS.font)
                        .padding([.bottom, .top], Spacing.medium)
                    Divider()
                    ActionSheetButton(
                        action: {
                            animateDismissal {
                                shouldShowCreateKeySet = true
                            }
                        },
                        icon: Asset.add.swiftUIImage,
                        text: Localizable.AddKeySet.Button.add.key
                    )
                    ActionSheetButton(
                        action: {
                            animateDismissal {
                                shouldShowRecoverKeySet = true
                            }
                        },
                        icon: Asset.recover.swiftUIImage,
                        text: Localizable.AddKeySet.Button.recover.key
                    )
                    EmptyButton(
                        action: animateDismissal(),
                        text: Localizable.AddKeySet.Button.cancel.key,
                        style: .emptySecondary()
                    )
                }
                .padding(.horizontal, Spacing.large)
                .padding(.bottom, Spacing.small + Spacing.medium)
            }
        )
    }

    private func animateDismissal(_ completion: @escaping () -> Void = {}) {
        Animations.chainAnimation(
            animateBackground.toggle(),
            delayedAnimationClosure: {
                isShowingNewSeedMenu = false
                completion()
            }()
        )
    }
}
