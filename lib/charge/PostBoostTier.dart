import 'package:flutter/material.dart';

class PostBoostOption {
  const PostBoostOption({
    required this.coins,
    required this.label,
    required this.benefit,
    required this.icon,
  });

  final int coins;
  final String label;
  final String benefit;
  final IconData icon;
}

class PostBoostTier {
  PostBoostTier._();

  static const List<PostBoostOption> options = [
    PostBoostOption(
      coins: 0,
      label: '普通发布',
      benefit: '免费发布，正常展示',
      icon: Icons.send_outlined,
    ),
    PostBoostOption(
      coins: 5,
      label: '轻度推广',
      benefit: '增加曝光机会',
      icon: Icons.trending_up,
    ),
    PostBoostOption(
      coins: 10,
      label: '优先展示',
      benefit: '广场优先排序',
      icon: Icons.star_outline,
    ),
    PostBoostOption(
      coins: 20,
      label: '热门推荐',
      benefit: '进入热门推荐池',
      icon: Icons.local_fire_department_outlined,
    ),
    PostBoostOption(
      coins: 50,
      label: '置顶推广',
      benefit: '广场置顶 24 小时',
      icon: Icons.rocket_launch_outlined,
    ),
  ];

  static PostBoostOption? optionForCoins(int coins) {
    for (final o in options) {
      if (o.coins == coins) return o;
    }
    return null;
  }
}
