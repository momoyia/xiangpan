class UserProfile {
  const UserProfile({
    required this.name,
    required this.bio,
    required this.avatarAsset,
    this.avatarUrl,
    this.avatarLocalPath,
    this.following = 128,
    this.followers = 4200,
    this.likes = 15800,
    this.collections = 89,
    this.activeDays = 18,
    this.exerciseMinutes = 1950,
    this.totalCalories = 8450,
    this.goalCompletionRate = 0.72,
    this.mealTitle = '牛油果鸡胸肉能量餐',
    this.mealCalories = 420,
    this.mealProtein = 42,
    this.mealCarbs = 35,
    this.trainingGoals = const [],
    this.interestedSports = const [],
    this.heightCm,
    this.weightKg,
  });

  final String name;
  final String bio;
  final String avatarAsset;
  final String? avatarUrl;
  final String? avatarLocalPath;
  final int following;
  final int followers;
  final int likes;
  final int collections;
  final int activeDays;
  final int exerciseMinutes;
  final int totalCalories;
  final double goalCompletionRate;
  final String mealTitle;
  final int mealCalories;
  final int mealProtein;
  final int mealCarbs;
  final List<String> trainingGoals;
  final List<String> interestedSports;
  final int? heightCm;
  final int? weightKg;

  UserProfile copyWith({
    String? name,
    String? bio,
    String? avatarAsset,
    String? avatarUrl,
    String? avatarLocalPath,
    bool clearAvatarUrl = false,
    bool clearAvatarLocalPath = false,
    int? exerciseMinutes,
    int? totalCalories,
    double? goalCompletionRate,
    int? activeDays,
    List<String>? trainingGoals,
    List<String>? interestedSports,
    int? heightCm,
    int? weightKg,
  }) {
    return UserProfile(
      name: name ?? this.name,
      bio: bio ?? this.bio,
      avatarAsset: avatarAsset ?? this.avatarAsset,
      avatarUrl: clearAvatarUrl ? null : (avatarUrl ?? this.avatarUrl),
      avatarLocalPath:
          clearAvatarLocalPath ? null : (avatarLocalPath ?? this.avatarLocalPath),
      following: following,
      followers: followers,
      likes: likes,
      collections: collections,
      activeDays: activeDays ?? this.activeDays,
      exerciseMinutes: exerciseMinutes ?? this.exerciseMinutes,
      totalCalories: totalCalories ?? this.totalCalories,
      goalCompletionRate: goalCompletionRate ?? this.goalCompletionRate,
      mealTitle: mealTitle,
      mealCalories: mealCalories,
      mealProtein: mealProtein,
      mealCarbs: mealCarbs,
      trainingGoals: trainingGoals ?? this.trainingGoals,
      interestedSports: interestedSports ?? this.interestedSports,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'bio': bio,
        'avatarAsset': avatarAsset,
        'avatarUrl': avatarUrl,
        'avatarLocalPath': avatarLocalPath,
        'trainingGoals': trainingGoals,
        'interestedSports': interestedSports,
        'heightCm': heightCm,
        'weightKg': weightKg,
      };

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'] as String? ?? '欢快的番茄',
      bio: json['bio'] as String? ?? '跑步爱好者 · 坚持打卡',
      avatarAsset: json['avatarAsset'] as String? ?? 'assets/images/avatar_cat.jpg',
      avatarUrl: json['avatarUrl'] as String?,
      avatarLocalPath: json['avatarLocalPath'] as String?,
      trainingGoals: (json['trainingGoals'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      interestedSports: (json['interestedSports'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      heightCm: json['heightCm'] as int?,
      weightKg: json['weightKg'] as int?,
    );
  }
}
