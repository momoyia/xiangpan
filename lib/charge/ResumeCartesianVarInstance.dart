class SkipDirectlyRoleOwner {
  final String itemId;
  final int coinAmount;
  final String displayPrice;

  const SkipDirectlyRoleOwner({
    required this.itemId,
    required this.coinAmount,
    required this.displayPrice,
  });
}

const List<SkipDirectlyRoleOwner> shopInventory = <SkipDirectlyRoleOwner>[
  SkipDirectlyRoleOwner(itemId: 'xiangpan_1', coinAmount: 1, displayPrice: '¥1'),
  SkipDirectlyRoleOwner(itemId: 'xiangpan_2', coinAmount: 5, displayPrice: '¥4'),
  SkipDirectlyRoleOwner(itemId: 'xiangpan_3', coinAmount: 10, displayPrice: '¥6'),
  SkipDirectlyRoleOwner(itemId: 'xiangpan_4', coinAmount: 20, displayPrice: '¥9'),
  SkipDirectlyRoleOwner(itemId: 'xiangpan_5', coinAmount: 30, displayPrice: '¥14'),
  SkipDirectlyRoleOwner(itemId: 'xiangpan_6', coinAmount: 40, displayPrice: '¥16'),
  SkipDirectlyRoleOwner(itemId: 'xiangpan_7', coinAmount: 50, displayPrice: '¥20'),
  SkipDirectlyRoleOwner(itemId: 'xiangpan_8', coinAmount: 100, displayPrice: '¥39'),
  SkipDirectlyRoleOwner(itemId: 'xiangpan_9', coinAmount: 200, displayPrice: '¥59'),
  SkipDirectlyRoleOwner(itemId: 'xiangpan_10', coinAmount: 300, displayPrice: '¥69'),
  SkipDirectlyRoleOwner(itemId: 'xiangpan_11', coinAmount: 400, displayPrice: '¥79'),
  SkipDirectlyRoleOwner(itemId: 'xiangpan_12', coinAmount: 500, displayPrice: '¥89'),
  SkipDirectlyRoleOwner(itemId: 'xiangpan_13', coinAmount: 700, displayPrice: '¥99'),
];
