import 'package:flutter/material.dart';
import '../core/constants/image_assets.dart';
import '../models/achievement_challenge.dart';
import '../models/discover_training.dart';
import '../models/discover_training_detail.dart';
import '../models/feed_comment.dart';
import '../models/feed_post.dart';
import '../models/feed_topic_tag.dart';
import '../models/fitness_plan_detail.dart';
import '../models/fitness_plan_item.dart';
import '../models/hot_plan_detail.dart';
import '../models/hot_plan_prep_info.dart';
import '../models/user_profile.dart';
import '../models/workout_plan.dart';
import '../models/workout_plan_detail.dart';

class MockData {
  MockData._();

  static const UserProfile defaultProfile = UserProfile(
    name: '欢快的番茄',
    bio: '跑步爱好者 · 坚持打卡',
    avatarAsset: ImageAssets.avatarCat,
  );

  static List<WorkoutPlan> get homeWorkouts => [
        const WorkoutPlan(
          id: 'w1',
          title: '雕塑腹肌：中强度燃脂',
          tag: '腰腹核心',
          tagColor: 0xFF8A31EB,
          duration: '15分钟',
          level: '进阶',
          calories: 140,
          imageAsset: ImageAssets.gym1,
          imageUrl: ImageAssets.pexelsGym,
          columnIndex: 0,
          imageHeight: 176,
        ),
        const WorkoutPlan(
          id: 'w2',
          title: '5KM 有氧代谢慢跑',
          tag: '晨间唤醒',
          tagColor: 0xFFFA84D2,
          duration: '30分钟',
          level: '初学者',
          calories: 320,
          imageAsset: ImageAssets.run1,
          imageUrl: ImageAssets.pexelsRun,
          columnIndex: 0,
          imageHeight: 144,
        ),
        const WorkoutPlan(
          id: 'w3',
          title: '流瑜伽：髋部深度拉伸',
          tag: '瑜伽塑形',
          tagColor: 0xFF8A31EB,
          duration: '20分钟',
          level: '初学者',
          calories: 90,
          imageAsset: ImageAssets.yoga1,
          imageUrl: ImageAssets.pexelsMorningYoga,
          columnIndex: 1,
          imageHeight: 128,
        ),
        const WorkoutPlan(
          id: 'w4',
          title: '全身性爆发力高阶训练',
          tag: '肌肉塑造',
          tagColor: 0xFF6366F1,
          duration: '45分钟',
          level: '专业',
          calories: 480,
          imageAsset: ImageAssets.homeCrossfit,
          imageUrl: ImageAssets.pexelsHomeCrossfit,
          columnIndex: 1,
          imageHeight: 192,
        ),
        const WorkoutPlan(
          id: 'w5',
          title: '15分钟暴汗跳绳燃脂',
          tag: '有氧燃脂',
          tagColor: 0xFFFA84D2,
          duration: '15分钟',
          level: '进阶',
          calories: 260,
          imageAsset: ImageAssets.homeJumprope,
          imageUrl: ImageAssets.pexelsHomeJumprope,
          columnIndex: 0,
          imageHeight: 160,
        ),
        const WorkoutPlan(
          id: 'w6',
          title: '动感单车 · 间歇燃脂',
          tag: '室内骑行',
          tagColor: 0xFF8A31EB,
          duration: '35分钟',
          level: '中级',
          calories: 380,
          imageAsset: ImageAssets.indoorRide,
          imageUrl: ImageAssets.pexelsCardio,
          columnIndex: 1,
          imageHeight: 136,
        ),
        const WorkoutPlan(
          id: 'w7',
          title: '日落漫步 · 低冲击减脂',
          tag: '户外行走',
          tagColor: 0xFF10B981,
          duration: '40分钟',
          level: '初学者',
          calories: 210,
          imageAsset: ImageAssets.homeWalk,
          imageUrl: ImageAssets.pexelsHomeWalk,
          columnIndex: 0,
          imageHeight: 152,
        ),
        const WorkoutPlan(
          id: 'w8',
          title: '晨间舒展 · 代谢唤醒',
          tag: '柔韧拉伸',
          tagColor: 0xFF8A31EB,
          duration: '12分钟',
          level: '初学者',
          calories: 75,
          imageAsset: ImageAssets.homePilates,
          imageUrl: ImageAssets.pexelsHomePilates,
          columnIndex: 1,
          imageHeight: 168,
        ),
        const WorkoutPlan(
          id: 'w9',
          title: '滨海骑行 · 持续燃脂',
          tag: '户外骑行',
          tagColor: 0xFF6366F1,
          duration: '50分钟',
          level: '进阶',
          calories: 420,
          imageAsset: ImageAssets.homeCycling,
          imageUrl: ImageAssets.pexelsHomeCycling,
          columnIndex: 0,
          imageHeight: 184,
        ),
        const WorkoutPlan(
          id: 'w10',
          title: 'Tabata 高强度燃脂',
          tag: 'HIIT冲刺',
          tagColor: 0xFFEF4444,
          duration: '25分钟',
          level: '专业',
          calories: 350,
          imageAsset: ImageAssets.homeHiit,
          imageUrl: ImageAssets.pexelsHomeHiit,
          columnIndex: 1,
          imageHeight: 140,
        ),
      ];

  static WorkoutPlan? findWorkoutById(String id) {
    try {
      return homeWorkouts.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  static WorkoutPlanDetail workoutDetail(WorkoutPlan plan) {
    return _workoutDetails[plan.id] ?? _defaultDetail(plan);
  }

  static WorkoutPlanDetail _defaultDetail(WorkoutPlan plan) => WorkoutPlanDetail(
        description: '${plan.title} 是一套科学编排的燃脂训练课程，结合有氧与力量元素，帮助你在短时间内提升代谢、塑造线条。',
        coachName: '相盼教练团',
        coachTitle: '认证健身教练',
        rating: 4.8,
        participants: 8600,
        steps: const [
          WorkoutStep(title: '热身激活', duration: '5 分钟', tip: '关节活动，逐渐提升心率'),
          WorkoutStep(title: '主训练', duration: '15 分钟', tip: '按节奏完成，注意呼吸'),
          WorkoutStep(title: '拉伸放松', duration: '5 分钟', tip: '缓解肌肉紧张'),
        ],
        equipment: const ['瑜伽垫', '运动鞋'],
        highlights: const ['科学燃脂', '适合新手', '无需器械'],
      );

  static final Map<String, WorkoutPlanDetail> _workoutDetails = {
    'w1': WorkoutPlanDetail(
      description: '针对腰腹核心的中强度训练，通过复合动作激活腹部深层肌群，配合燃脂节奏加速代谢，适合想要紧致腰线、强化核心的你。',
      coachName: '林夏',
      coachTitle: '核心训练专家',
      rating: 4.9,
      participants: 28400,
      steps: const [
        WorkoutStep(title: '核心唤醒', duration: '4 分钟'),
        WorkoutStep(title: '腹肌燃脂组合', duration: '8 分钟', tip: '保持腹部收紧'),
        WorkoutStep(title: '侧腹雕刻', duration: '5 分钟'),
        WorkoutStep(title: '拉伸收束', duration: '3 分钟'),
      ],
      equipment: const ['瑜伽垫'],
      highlights: const ['腰腹塑形', '中强度', '无跳跃'],
      suitableFor: '有一定运动基础',
    ),
    'w2': WorkoutPlanDetail(
      description: '5公里有氧慢跑计划，采用间歇跑走结合的方式，降低膝盖压力的同时稳定提升心肺耐力，是减脂入门者的理想选择。',
      coachName: '阿泽',
      coachTitle: '跑步教练',
      rating: 4.8,
      participants: 52100,
      steps: const [
        WorkoutStep(title: '动态热身', duration: '5 分钟'),
        WorkoutStep(title: '慢跑 + 快走交替', duration: '20 分钟', tip: '心率保持在燃脂区间'),
        WorkoutStep(title: '冷身拉伸', duration: '5 分钟'),
      ],
      equipment: const ['跑鞋', '运动耳机（可选）'],
      highlights: const ['不伤膝盖', '户外可练', '燃脂高效'],
      suitableFor: '初学者友好',
    ),
    'w3': WorkoutPlanDetail(
      description: '流瑜伽髋部深度拉伸课程，通过连贯体式打开髋关节、延展脊柱，缓解久坐疲劳，同时温和激活全身代谢。',
      coachName: '苏婉',
      coachTitle: '瑜伽导师',
      rating: 4.9,
      participants: 19800,
      steps: const [
        WorkoutStep(title: '呼吸调息', duration: '3 分钟'),
        WorkoutStep(title: '拜日式流动', duration: '6 分钟'),
        WorkoutStep(title: '髋部深度拉伸', duration: '8 分钟'),
        WorkoutStep(title: '冥想放松', duration: '3 分钟'),
      ],
      equipment: const ['瑜伽垫'],
      highlights: const ['柔韧提升', '舒缓压力', '低冲击'],
      suitableFor: '所有水平',
    ),
    'w4': WorkoutPlanDetail(
      description: '全身爆发力高阶训练，融合深蹲、波比跳、登山跑等复合动作，快速拉高心率，适合有训练基础、追求高效燃脂的进阶者。',
      coachName: '铁哥',
      coachTitle: '高强度训练师',
      rating: 4.7,
      participants: 15600,
      steps: const [
        WorkoutStep(title: '动态热身', duration: '6 分钟'),
        WorkoutStep(title: '爆发力循环 ×3', duration: '30 分钟', tip: '组间休息 45 秒'),
        WorkoutStep(title: '核心稳定', duration: '5 分钟'),
        WorkoutStep(title: '放松拉伸', duration: '4 分钟'),
      ],
      equipment: const ['瑜伽垫', '水壶'],
      highlights: const ['全身燃脂', '高消耗', '突破平台期'],
      suitableFor: '进阶 / 专业',
    ),
    'w5': WorkoutPlanDetail(
      description: '15分钟跳绳燃脂冲刺，利用短时高强度间歇激活全身肌群，燃脂效率媲美长时间慢跑，适合时间紧张的上班族。',
      coachName: '小鹿',
      coachTitle: '有氧教练',
      rating: 4.8,
      participants: 34200,
      steps: const [
        WorkoutStep(title: '关节热身', duration: '3 分钟'),
        WorkoutStep(title: '跳绳间歇 ×6', duration: '10 分钟', tip: '跳 40 秒 · 休 20 秒'),
        WorkoutStep(title: '小腿拉伸', duration: '2 分钟'),
      ],
      equipment: const ['跳绳'],
      highlights: const ['超省时', '暴汗燃脂', '随时开练'],
    ),
    'w6': WorkoutPlanDetail(
      description: '动感单车间歇燃脂课，模拟户外爬坡与冲刺，在音乐节奏中完成心肺挑战，高效燃烧卡路里同时保护膝关节。',
      coachName: 'Mike',
      coachTitle: '单车教练',
      rating: 4.8,
      participants: 22300,
      steps: const [
        WorkoutStep(title: '座姿热身骑行', duration: '5 分钟'),
        WorkoutStep(title: '间歇冲刺', duration: '25 分钟'),
        WorkoutStep(title: '放松骑行', duration: '5 分钟'),
      ],
      equipment: const ['动感单车 / 健身车'],
      highlights: const ['低冲击', '音乐节奏', '燃脂持久'],
    ),
    'w7': WorkoutPlanDetail(
      description: '日落漫步低冲击减脂，以快走为主、结合轻度摆臂与核心收紧，适合大体重或恢复期的伙伴温和开启减脂之路。',
      coachName: '阿泽',
      coachTitle: '户外行走教练',
      rating: 4.9,
      participants: 18700,
      steps: const [
        WorkoutStep(title: '慢速热身走', duration: '8 分钟'),
        WorkoutStep(title: '快速快走', duration: '28 分钟'),
        WorkoutStep(title: '腿部拉伸', duration: '4 分钟'),
      ],
      equipment: const ['舒适运动鞋'],
      highlights: const ['低冲击', '户外疗愈', '大体重友好'],
      suitableFor: '初学者 / 恢复期',
    ),
    'w8': WorkoutPlanDetail(
      description: '晨间舒展代谢唤醒，通过普拉提式动作激活深层核心、改善体态，温和提升一整天的基础代谢水平。',
      coachName: '苏婉',
      coachTitle: '普拉提教练',
      rating: 4.9,
      participants: 24100,
      steps: const [
        WorkoutStep(title: '脊柱唤醒', duration: '4 分钟'),
        WorkoutStep(title: '核心控制序列', duration: '6 分钟'),
        WorkoutStep(title: '全身延展', duration: '5 分钟'),
      ],
      equipment: const ['瑜伽垫'],
      highlights: const ['晨间必备', '体态矫正', '温和燃脂'],
    ),
    'w9': WorkoutPlanDetail(
      description: '滨海骑行持续燃脂，模拟户外平路骑行强度，稳定维持有氧区间，适合喜欢骑行、追求长时间脂肪氧化的运动爱好者。',
      coachName: 'Mike',
      coachTitle: '骑行教练',
      rating: 4.7,
      participants: 9800,
      steps: const [
        WorkoutStep(title: '低阻力热身', duration: '8 分钟'),
        WorkoutStep(title: '稳态骑行', duration: '38 分钟', tip: '保持踏频 80-90'),
        WorkoutStep(title: '臀腿拉伸', duration: '4 分钟'),
      ],
      equipment: const ['单车 / 骑行台'],
      highlights: const ['持久燃脂', '膝盖友好', '耐力提升'],
    ),
    'w10': WorkoutPlanDetail(
      description: 'Tabata 高强度燃脂，20秒全力 + 10秒休息的经典模式，最大化运动后过量氧耗效应，24小时内持续燃烧更多热量。',
      coachName: '铁哥',
      coachTitle: 'HIIT 专家',
      rating: 4.8,
      participants: 41200,
      steps: const [
        WorkoutStep(title: '全身热身', duration: '5 分钟'),
        WorkoutStep(title: 'Tabata ×8 轮', duration: '16 分钟', tip: '共 8 个动作循环'),
        WorkoutStep(title: '冷身拉伸', duration: '4 分钟'),
      ],
      equipment: const ['瑜伽垫'],
      highlights: const ['短时高效', '后燃效应', '突破瓶颈'],
      suitableFor: '中级及以上',
    ),
  };

  static List<DiscoverTraining> get discoverTrainings => [
        const DiscoverTraining(
          id: 'walk',
          label: '户外行走',
          title: '日落环山漫步计划',
          stars: 2,
          time: '45 分钟',
          calories: '280 Kcal',
          imageAsset: ImageAssets.walkHero,
          imageUrl: ImageAssets.pexelsWalk,
        ),
        const DiscoverTraining(
          id: 'rope',
          label: '跳绳',
          title: '燃脂暴汗跳绳冲刺',
          stars: 4,
          time: '20 分钟',
          calories: '350 Kcal',
          imageAsset: ImageAssets.ropeHero,
        ),
        const DiscoverTraining(
          id: 'indoor-ride',
          label: '室内骑行',
          title: '超感官动感单车：震撼重低音',
          stars: 3,
          time: '35 分钟',
          calories: '400 Kcal',
          imageAsset: ImageAssets.indoorRide,
        ),
        const DiscoverTraining(
          id: 'outdoor-ride',
          label: '户外骑行',
          title: '破风追逐：滨海沿线疾骑',
          stars: 5,
          time: '60 分钟',
          calories: '650 Kcal',
          imageAsset: ImageAssets.outdoorRide,
        ),
      ];

  static DiscoverTrainingDetail discoverTrainingDetail(String id) {
    return _discoverTrainingDetails[id] ?? _discoverTrainingDetails['walk']!;
  }

  static final Map<String, DiscoverTrainingDetail> _discoverTrainingDetails = {
    'walk': DiscoverTrainingDetail(
      id: 'walk',
      label: '户外行走',
      title: '日落环山漫步计划',
      subtitle: '用脚步丈量坡度，在余晖里完成有氧闭环',
      sceneCode: 'FIELD-WALK-07',
      atmosphere: '林荫步道 · 傍晚微风 · 低冲击',
      description:
          '这是一段为城市周边徒步设计的「训练时空」。不追求配速与冲刺，而是通过稳定步频、摆臂与呼吸配合，在 45 分钟内完成心肺激活与脂肪氧化。适合作为下班后的解压训练，也可串联周末登山前的基础耐力储备。',
      imageAsset: ImageAssets.walkHero,
      imageUrl: ImageAssets.pexelsWalk,
      stars: 2,
      time: '45 分钟',
      calories: '280 Kcal',
      participants: 12400,
      intensityLabel: '低冲击有氧',
      heartRateZone: '最大心率 55%–65%',
      phases: const [
        DiscoverPhase(
          name: '步道热身',
          duration: '8 分钟',
          scene: '缓坡步行，肩背放松',
          bodyFeel: '身体微微发热',
        ),
        DiscoverPhase(
          name: '环山主段',
          duration: '28 分钟',
          scene: '保持可对话步频',
          bodyFeel: '呼吸加深但可控',
        ),
        DiscoverPhase(
          name: '落日冷身',
          duration: '9 分钟',
          scene: '拉伸小腿与髋部',
          bodyFeel: '心率平稳下降',
        ),
      ],
      ambienceTags: const ['余晖', '自然白噪音', '坡度变化', '疗愈节奏'],
      environmentTips: const [
        '选择照明良好的步道，避免夜间视线盲区',
        '雨后路面湿滑时改在平地完成主段',
        '可佩戴轻便背包，重量不超过 3 kg',
      ],
      gearList: const ['缓震跑鞋', '防风薄外套', '水壶 500ml'],
      suitableCrowd: '减脂入门 · 久未运动重启 · 不喜欢跳跃',
      safetyNotes: const [
        '膝盖不适时缩短主段，增加冷身时间',
        '头晕或胸闷立即停止并补水',
      ],
      coachQuote: '「走得稳，比走得快更能坚持一辈子。」— 相盼户外教练 阿泽',
      bestTime: '傍晚 17:00–19:00 或清晨',
    ),
    'rope': DiscoverTrainingDetail(
      id: 'rope',
      label: '跳绳',
      title: '燃脂暴汗跳绳冲刺',
      subtitle: '短时高频，在原地打开代谢加速器',
      sceneCode: 'FIELD-ROPE-12',
      atmosphere: '室内空地 · 节奏鼓点 · 高燃',
      description:
          '训练时空聚焦「原地高强度」。通过间歇跳绳拉高心率，在 20 分钟内完成传统 40 分钟慢跑相近的燃脂刺激。适合时间紧张、希望快速出汗的伙伴，建议有一定运动基础后挑战。',
      imageAsset: ImageAssets.ropeHero,
      stars: 4,
      time: '20 分钟',
      calories: '350 Kcal',
      participants: 34200,
      intensityLabel: '高强度间歇',
      heartRateZone: '最大心率 70%–85%',
      phases: const [
        DiscoverPhase(
          name: '腕踝激活',
          duration: '3 分钟',
          scene: '无绳空跳 + 关节绕环',
          bodyFeel: '关节渐暖',
        ),
        DiscoverPhase(
          name: '间歇冲刺',
          duration: '14 分钟',
          scene: '跳 40 秒 · 休 20 秒 ×6',
          bodyFeel: '暴汗、心率飙升',
        ),
        DiscoverPhase(
          name: '缓和落地',
          duration: '3 分钟',
          scene: '慢走 + 小腿拉伸',
          bodyFeel: '呼吸回落',
        ),
      ],
      ambienceTags: const ['节拍驱动', '原地训练', '暴汗', '短时高效'],
      environmentTips: const [
        '选择有缓冲的地面，避免硬水泥地长时间跳跃',
        '层高需允许挥绳，建议 2.6m 以上',
        '楼下有邻居时降低落地力度',
      ],
      gearList: const ['跳绳', '运动鞋', '毛巾'],
      suitableCrowd: '有运动基础 · 时间碎片化 · 追求高消耗',
      safetyNotes: const [
        '膝盖或脚踝疼痛者不建议参与',
        '空腹训练请准备少量补给',
      ],
      coachQuote: '「节奏对了，20 分钟也能练出 40 分钟的效果。」— 相盼教练 小鹿',
      bestTime: '午后或傍晚（饭后 1.5 小时）',
    ),
    'indoor-ride': DiscoverTrainingDetail(
      id: 'indoor-ride',
      label: '室内骑行',
      title: '超感官动感单车：震撼重低音',
      subtitle: '在律动灯光里完成心肺与下肢的协同挑战',
      sceneCode: 'FIELD-RIDE-IN-03',
      atmosphere: '暗光训练房 · 重低音 · 团队氛围',
      description:
          '室内骑行时空模拟「夜骑俱乐部」体验：坐姿热身、站姿爬坡与冲刺交替，配合音乐节奏控制踏频。35 分钟内强化下肢耐力与心肺峰值，对膝关节冲击低于跑步。',
      imageAsset: ImageAssets.indoorRide,
      stars: 3,
      time: '35 分钟',
      calories: '400 Kcal',
      participants: 22300,
      intensityLabel: '中高强度循环',
      heartRateZone: '最大心率 65%–80%',
      phases: const [
        DiscoverPhase(
          name: '座姿热身',
          duration: '6 分钟',
          scene: '轻阻力匀速踏频',
          bodyFeel: '下肢逐渐升温',
        ),
        DiscoverPhase(
          name: '爬坡站姿',
          duration: '12 分钟',
          scene: '增加阻力，模拟上坡',
          bodyFeel: '大腿酸胀明显',
        ),
        DiscoverPhase(
          name: '节奏冲刺',
          duration: '11 分钟',
          scene: '快慢交替，跟拍子踩',
          bodyFeel: '心肺压力上升',
        ),
        DiscoverPhase(
          name: '放松骑行',
          duration: '6 分钟',
          scene: '降阻力冷身',
          bodyFeel: '汗水渐止',
        ),
      ],
      ambienceTags: const ['重低音', '暗光', '团队骑行', '低冲击'],
      environmentTips: const [
        '调整车座高度：踩到最低点时膝盖微屈',
        '保持毛巾与饮水，室内注意通风',
        '新手可先降低阻力完成全程',
      ],
      gearList: const ['动感单车 / 健身车', '骑行鞋或硬底鞋', '毛巾'],
      suitableCrowd: '喜欢音乐节奏 · 需保护膝盖 · 雨天备选',
      safetyNotes: const [
        '头晕时立即停止并下车休息',
        '腰部不适者缩短站姿时长',
      ],
      coachQuote: '「跟着节拍踩，身体会记得燃脂的节奏。」— 相盼教练 Mike',
      bestTime: '任意时段，避开刚吃饱',
    ),
    'outdoor-ride': DiscoverTrainingDetail(
      id: 'outdoor-ride',
      label: '户外骑行',
      title: '破风追逐：滨海沿线疾骑',
      subtitle: '在真实风景里感受速度与耐力的双重考验',
      sceneCode: 'FIELD-RIDE-OUT-09',
      atmosphere: '滨海公路 · 海风 · 长距离',
      description:
          '户外骑行时空强调「真实路况」：逆风、缓坡与长直线交替，训练腿部爆发力与有氧耐力。60 分钟适合周末拉练，也可拆分为两次 30 分钟完成。请确保路况安全并遵守交通规则。',
      imageAsset: ImageAssets.outdoorRide,
      stars: 5,
      time: '60 分钟',
      calories: '650 Kcal',
      participants: 9800,
      intensityLabel: '长距离耐力',
      heartRateZone: '最大心率 60%–75%',
      phases: const [
        DiscoverPhase(
          name: '城市热身骑',
          duration: '10 分钟',
          scene: '低速巡航，检查车况',
          bodyFeel: '肌肉激活',
        ),
        DiscoverPhase(
          name: '滨海主骑',
          duration: '40 分钟',
          scene: '稳定踏频，逆风加力',
          bodyFeel: '耐力被拉长',
        ),
        DiscoverPhase(
          name: '返程冷骑',
          duration: '10 分钟',
          scene: '降低配速，拉伸',
          bodyFeel: '满足与疲惫并存',
        ),
      ],
      ambienceTags: const ['真实风景', '海风', '长距离', '破风感'],
      environmentTips: const [
        '佩戴头盔，检查刹车与胎压',
        '避免高峰路段，注意来车',
        '携带补给与简易维修工具',
      ],
      gearList: const ['公路车 / 山地车', '头盔', '骑行手套', '水壶'],
      suitableCrowd: '有骑行经验 · 周末拉练 · 耐力挑战者',
      safetyNotes: const [
        '极端天气（大风暴雨）请改期',
        '遵守交规，不竞速占道',
      ],
      coachQuote: '「风从正面来的时候，才是耐力真正开始的时刻。」— 相盼户外教练',
      bestTime: '周末上午或日落前',
    ),
  };

  static const AchievementChallenge hikingMedalChallenge = AchievementChallenge(
        id: 'hiking-medal',
        title: '勋章挑战：徒步者之境',
        subtitle: '本周累计行走已达 12 KM',
        description:
            '在 7 天挑战周期内累计完成户外行走里程，解锁「徒步者之境」限定勋章与相盼积分奖励。适合喜欢散步、慢跑或户外徒步的你，里程可拆分多次完成。',
        currentKm: 12,
        targetKm: 20,
        participants: 18600,
        endDate: '本周日 23:59',
        rules: const [
          '仅统计「户外行走」类课程产生的有效里程',
          '单次训练需满 10 分钟方可计入',
          '每日上限计入 8 KM，鼓励循序渐进',
          '完成后勋章自动发放至「我的」勋章墙',
        ],
        milestones: const [
          ChallengeMilestone(distanceKm: 5, reward: '青铜徒步徽章', unlocked: true),
          ChallengeMilestone(distanceKm: 12, reward: '白银徒步徽章', unlocked: true),
          ChallengeMilestone(distanceKm: 20, reward: '徒步者之境勋章', unlocked: false),
        ],
        rewards: const [
          '完成 20 KM：限定勋章 + 200 相盼积分',
          '进入前 10%：额外 50 积分',
          '全程无中断打卡：「坚持者」标签 7 天',
        ],
      );

  static const List<FeedTopicTag> feedTopicTags = [
    FeedTopicTag(label: '#晨跑打卡', color: 0xFF10B981),
    FeedTopicTag(label: '#今日拉伸', color: 0xFF8A31EB),
    FeedTopicTag(label: '#瑜伽女孩', color: 0xFFFA84D2),
    FeedTopicTag(label: '#力量训练', color: 0xFF6366F1),
    FeedTopicTag(label: '#HIIT', color: 0xFFEF4444),
    FeedTopicTag(label: '#练后餐', color: 0xFF10B981),
    FeedTopicTag(label: '#宿舍健身', color: 0xFF8A31EB),
    FeedTopicTag(label: '#周末徒步', color: 0xFF6366F1),
    FeedTopicTag(label: '#有氧燃脂', color: 0xFFFA84D2),
    FeedTopicTag(label: '#骑行日', color: 0xFF6366F1),
  ];

  static List<FeedPost> get feedPosts => [
        const FeedPost(
          id: 'f1',
          authorName: '沫野_Jane',
          authorAvatar: ImageAssets.avatarCat,
          location: '流光瑜伽馆',
          timeAgo: '北京 · 3小时前发布',
          content: '今日晨曦流瑜伽打卡🧘‍♀️，身体的每一次延展都在和晨光拥抱！',
          tags: ['#晨间仪式感', '#今日拉伸', '#瑜伽女孩'],
          tagColors: [0xFF8A31EB, 0xFFFA84D2, 0xFF6366F1],
          imageAsset: ImageAssets.feedYoga,
          imageUrl: ImageAssets.pexelsFeedYoga,
          likeCount: 128,
          commentCount: 45,
        ),
        const FeedPost(
          id: 'f2',
          authorName: '山海行者_Eric',
          authorAvatar: ImageAssets.avatarLandscape,
          location: '黑曜石力量矩阵',
          timeAgo: '深圳 · 6小时前发布',
          content: '背部轰炸日！今日硬拉直冲 120KG，成功突破平台期！爽！🏋️‍♂️💪',
          tags: ['#硬拉突破', '#力量训练'],
          tagColors: [0xFF8A31EB, 0xFF6366F1],
          imageAsset: ImageAssets.feedGym,
          imageUrl: ImageAssets.pexelsFeedGym,
          likeCount: 324,
          commentCount: 82,
        ),
        const FeedPost(
          id: 'f3',
          authorName: '晨跑小鹿_Luna',
          authorAvatar: ImageAssets.avatarAnimal,
          location: '滨江绿道 5KM',
          timeAgo: '杭州 · 8小时前发布',
          content: '日出前开跑，风很凉心率很稳。配速 5\'40\" 完成，膝盖零负担！🌅',
          tags: ['#晨跑打卡', '#有氧恢复', '#滨江绿道'],
          tagColors: [0xFF10B981, 0xFF6366F1, 0xFF8A31EB],
          imageAsset: ImageAssets.feedRun,
          imageUrl: ImageAssets.pexelsFeedRun,
          likeCount: 96,
          commentCount: 18,
        ),
        const FeedPost(
          id: 'f4',
          authorName: '燃脂队长_Kai',
          authorAvatar: ImageAssets.avatarFood,
          location: '相盼 HIIT 实验室',
          timeAgo: '上海 · 昨天发布',
          content: '20 分钟 Tabata 榨干最后一滴汗，心率峰值 168，代谢还在燃烧🔥',
          tags: ['#HIIT', '#暴汗挑战'],
          tagColors: [0xFFEF4444, 0xFF8A31EB],
          imageAsset: ImageAssets.feedHiit,
          imageUrl: ImageAssets.pexelsFeedHiit,
          likeCount: 512,
          commentCount: 134,
        ),
        const FeedPost(
          id: 'f5',
          authorName: '单车少女_Mia',
          authorAvatar: ImageAssets.avatarCat,
          location: '室内骑行舱 · B12',
          timeAgo: '成都 · 昨天发布',
          content: '45 分钟节奏骑行，平均踏频 88，像在开一场只有自己的演唱会🎧',
          tags: ['#骑行日', '#心肺耐力'],
          tagColors: [0xFF6366F1, 0xFFFA84D2],
          imageAsset: ImageAssets.feedCycle,
          imageUrl: ImageAssets.pexelsFeedCycle,
          likeCount: 203,
          commentCount: 56,
        ),
        const FeedPost(
          id: 'f6',
          authorName: '轻食研究所_Amy',
          authorAvatar: ImageAssets.avatarFood,
          location: '相盼营养角',
          timeAgo: '广州 · 2天前发布',
          content: '练后餐：鸡胸+牛油果+杂粮饭，蛋白质 38g，好吃不委屈胃🥗',
          tags: ['#练后餐', '#高蛋白', '#减脂餐'],
          tagColors: [0xFF10B981, 0xFFFA84D2, 0xFF8A31EB],
          imageAsset: ImageAssets.mealSalad,
          imageUrl: ImageAssets.pexelsMeal,
          likeCount: 167,
          commentCount: 39,
        ),
        const FeedPost(
          id: 'f7',
          authorName: '跳绳小王子_Neo',
          authorAvatar: ImageAssets.avatarAnimal,
          location: '宿舍健身角',
          timeAgo: '武汉 · 2天前发布',
          content: '间歇跳绳 800 个，休息 30 秒×6 组，汗从额头滴到地板也值了！',
          tags: ['#宿舍健身', '#跳绳燃脂'],
          tagColors: [0xFF8A31EB, 0xFFEF4444],
          imageAsset: ImageAssets.feedJump,
          imageUrl: ImageAssets.pexelsFeedJump,
          likeCount: 88,
          commentCount: 21,
        ),
        const FeedPost(
          id: 'f8',
          authorName: '山野漫步_Owen',
          authorAvatar: ImageAssets.avatarLandscape,
          location: '青龙湖环线',
          timeAgo: '重庆 · 3天前发布',
          content: '周末徒步 12KM，步数破两万，风景和乳酸一样上头⛰️',
          tags: ['#周末徒步', '#低强度有氧', '#户外'],
          tagColors: [0xFF10B981, 0xFF6366F1, 0xFF8A31EB],
          imageAsset: ImageAssets.feedHike,
          imageUrl: ImageAssets.pexelsFeedHike,
          likeCount: 241,
          commentCount: 67,
        ),
      ];

  static FeedPost? findFeedPostById(String id) {
    try {
      return feedPosts.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  static FeedPost? findPostById(String id, {List<FeedPost> userPosts = const []}) {
    final mock = findFeedPostById(id);
    if (mock != null) return mock;
    try {
      return userPosts.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  static List<FeedPost> feedPostsByAuthor(String authorName) {
    return feedPosts.where((p) => p.authorName == authorName).toList();
  }

  static String feedAuthorBio(String authorName) {
    const bios = {
      '沫野_Jane': '晨光瑜伽师 · 专注流瑜伽与身心舒展',
      '山海行者_Eric': '力量举爱好者 · 硬拉 PR 挑战中',
      '晨跑小鹿_Luna': '滨江跑团成员 · 日出打卡党',
      '燃脂队长_Kai': 'HIIT 教练 · Tabata 狂热者',
      '单车少女_Mia': '室内骑行控 · 节奏与踏频研究者',
      '轻食研究所_Amy': '练后营养 · 高蛋白餐分享',
      '跳绳小王子_Neo': '宿舍健身 · 跳绳燃脂推广',
      '山野漫步_Owen': '周末徒步 · 户外摄影记录',
    };
    return bios[authorName] ?? '相盼健身爱好者 · 流汗不停';
  }

  static ({int posts, int followers, int likes}) feedAuthorStats(String authorName) {
    final posts = feedPostsByAuthor(authorName);
    var likes = 0;
    for (final p in posts) {
      likes += p.likeCount;
    }
    final followers = (authorName.hashCode % 9000) + 1200;
    return (posts: posts.length, followers: followers, likes: likes);
  }

  static List<FeedComment> feedCommentsForPost(String postId) {
    return _feedComments[postId] ?? _feedComments['_default']!;
  }

  static final Map<String, List<FeedComment>> _feedComments = {
    '_default': const [
      FeedComment(
        id: 'c0',
        authorName: '相盼小助手',
        authorAvatar: ImageAssets.avatarCat,
        content: '太棒了！继续保持！',
        timeAgo: '刚刚',
        likeCount: 12,
      ),
    ],
    'f1': const [
      FeedComment(
        id: 'c1',
        authorName: '瑜伽小鹿',
        authorAvatar: ImageAssets.avatarAnimal,
        content: '体式好舒展！请问这节课适合新手吗？',
        timeAgo: '2小时前',
        likeCount: 8,
      ),
      FeedComment(
        id: 'c2',
        authorName: '晨光跑者',
        authorAvatar: ImageAssets.avatarLandscape,
        content: '同款瑜伽馆！周末一起晨练呀～',
        timeAgo: '1小时前',
        likeCount: 5,
      ),
      FeedComment(
        id: 'c3',
        authorName: '沫野_Jane',
        authorAvatar: ImageAssets.avatarCat,
        content: '欢迎新手，第一节会从呼吸开始带哦🧘‍♀️',
        timeAgo: '45分钟前',
        likeCount: 16,
      ),
    ],
    'f2': const [
      FeedComment(
        id: 'c4',
        authorName: '铁馆老司机',
        authorAvatar: ImageAssets.avatarFood,
        content: '120KG 硬拉太强了！注意腰背收紧。',
        timeAgo: '3小时前',
        likeCount: 24,
      ),
      FeedComment(
        id: 'c5',
        authorName: '山海行者_Eric',
        authorAvatar: ImageAssets.avatarLandscape,
        content: '谢谢提醒！今天用了腰带，感觉稳很多。',
        timeAgo: '2小时前',
        likeCount: 11,
      ),
    ],
    'f3': const [
      FeedComment(
        id: 'c6',
        authorName: '滨江跑团',
        authorAvatar: ImageAssets.avatarAnimal,
        content: '5\'40\" 配速厉害！明天团练来吗？',
        timeAgo: '5小时前',
        likeCount: 6,
      ),
    ],
    'f4': const [
      FeedComment(
        id: 'c7',
        authorName: '燃脂搭子',
        authorAvatar: ImageAssets.avatarCat,
        content: 'Tabata 太狠了，练完腿都在抖哈哈',
        timeAgo: '昨天',
        likeCount: 42,
      ),
      FeedComment(
        id: 'c8',
        authorName: '心率控',
        authorAvatar: ImageAssets.avatarLandscape,
        content: '168 峰值合理，记得练后拉伸～',
        timeAgo: '昨天',
        likeCount: 18,
      ),
    ],
    'f5': const [
      FeedComment(
        id: 'c9',
        authorName: '骑行爱好者',
        authorAvatar: ImageAssets.avatarFood,
        content: '踏频 88 很稳！歌单可以分享一下吗',
        timeAgo: '昨天',
        likeCount: 9,
      ),
    ],
    'f6': const [
      FeedComment(
        id: 'c10',
        authorName: '营养师小白',
        authorAvatar: ImageAssets.avatarAnimal,
        content: '搭配很均衡，牛油果好评！',
        timeAgo: '2天前',
        likeCount: 7,
      ),
    ],
    'f7': const [
      FeedComment(
        id: 'c11',
        authorName: '宿舍健身党',
        authorAvatar: ImageAssets.avatarCat,
        content: '800 个太强了，我才跳到 400😂',
        timeAgo: '2天前',
        likeCount: 15,
      ),
    ],
    'f8': const [
      FeedComment(
        id: 'c12',
        authorName: '户外摄影',
        authorAvatar: ImageAssets.avatarLandscape,
        content: '青龙湖风景绝了！求路线图',
        timeAgo: '3天前',
        likeCount: 21,
      ),
      FeedComment(
        id: 'c13',
        authorName: '山野漫步_Owen',
        authorAvatar: ImageAssets.avatarLandscape,
        content: '路线图我私你，周末可以组队！',
        timeAgo: '2天前',
        likeCount: 9,
      ),
    ],
  };

  static Color tagColor(int value) => Color(value);

  static FeaturedFitnessPlan featuredPlan(String userName) => FeaturedFitnessPlan(
        badge: '$userName 的轻盈燃脂方案',
        title: '28 天代谢唤醒 · 温和减脂计划',
        subtitle: '不节食也能瘦 · 每天动一点，身体会感谢你',
        imageAsset: ImageAssets.run1,
        imageUrl: ImageAssets.pexelsBrightWorkout,
        days: const [
          PlanDayPreview(
            dayLabel: '第 1 天',
            sessions: ['10 分钟晨间唤醒操', '18 分钟低冲击有氧'],
          ),
          PlanDayPreview(
            dayLabel: '第 2 天',
            sessions: ['12 分钟核心激活', '15 分钟快乐跳绳'],
          ),
        ],
      );

  static List<HotPlanRecommend> get hotPlanRecommends => const [
        HotPlanRecommend(
          id: 'h1',
          badge: '近期热门',
          badgeColor: 0xFFEF4444,
          title: '大体重 · 全身燃脂',
          subtitle: '零基础 不伤膝盖 巨暴汗',
          imageAsset: ImageAssets.gym2,
          imageUrl: ImageAssets.pexelsAbs,
        ),
        HotPlanRecommend(
          id: 'h2',
          badge: '智能定制',
          badgeColor: 0xFF10B981,
          title: '学生专属 · 瘦全身',
          subtitle: '宿舍可练 每天 15 分钟',
          imageAsset: ImageAssets.yoga1,
          imageUrl: ImageAssets.pexelsStretch,
        ),
        HotPlanRecommend(
          id: 'h3',
          badge: '近期热门',
          badgeColor: 0xFFEF4444,
          title: '产后修复 · 燃脂',
          subtitle: '温和塑形 重启代谢',
          imageAsset: ImageAssets.run1,
          imageUrl: ImageAssets.pexelsRun,
        ),
      ];

  static HotPlanDetail hotPlanDetail(String id) {
    return _hotPlanDetails[id] ?? _hotPlanDetails['h1']!;
  }

  static HotPlanPrepInfo hotPlanPrepInfo(String id) {
    return _hotPlanPrepInfos[id] ?? _hotPlanPrepInfos['h1']!;
  }

  static final Map<String, HotPlanDetail> _hotPlanDetails = {
    'h1': HotPlanDetail(
      id: 'h1',
      badge: '近期热门',
      badgeColor: 0xFFEF4444,
      title: '大体重 · 全身燃脂',
      subtitle: '零基础 不伤膝盖 巨暴汗',
      description:
          '热门推荐单次组合课，专为 BMI 偏高人群设计。全程站立、无跳跃，用安全的心率区间完成高效燃脂，练完即可感受微微发热与舒展。',
      imageAsset: ImageAssets.gym2,
      imageUrl: ImageAssets.pexelsAbs,
      level: '入门友好',
      totalMinutes: 34,
      calories: 280,
      participants: 456000,
      rating: 4.8,
      reasons: const [
        '全程站立，膝盖几乎零冲击',
        '按大体重心率区间编排强度',
        '练后代谢维持，适合晚间开练',
      ],
      sessions: const [
        HotPlanSessionItem(name: '关节唤醒', duration: '12 分钟', intensity: '轻松'),
        HotPlanSessionItem(name: '站立燃脂主课', duration: '22 分钟', intensity: '适中'),
      ],
      suitableFor: '零基础 · BMI 偏高 · 久未运动',
      testimonial: '「练完没有膝盖不适，出汗量刚刚好。」— 练过 2.3 万次',
    ),
    'h2': HotPlanDetail(
      id: 'h2',
      badge: '智能定制',
      badgeColor: 0xFF10B981,
      title: '学生专属 · 瘦全身',
      subtitle: '宿舍可练 每天 15 分钟',
      description:
          '利用宿舍 2 平米空间即可完成。短时 HIIT 拉高心率，配合核心激活，帮助学生在课业间隙维持体态，不打扰室友、不依赖器械。',
      imageAsset: ImageAssets.yoga1,
      imageUrl: ImageAssets.pexelsStretch,
      level: '碎片时间',
      totalMinutes: 23,
      calories: 195,
      participants: 892000,
      rating: 4.9,
      reasons: const [
        '无器械，宿舍/寝室即可开练',
        '单次 23 分钟，课间也能完成',
        '动静结合，楼下友好不扰民',
      ],
      sessions: const [
        HotPlanSessionItem(name: '身体唤醒', duration: '8 分钟', intensity: '轻松'),
        HotPlanSessionItem(name: '宿舍 HIIT', duration: '15 分钟', intensity: '适中'),
      ],
      suitableFor: '学生党 · 时间碎片化',
      testimonial: '「期末周也能坚持，不用去健身房。」— 宿舍党高频好评',
    ),
    'h3': HotPlanDetail(
      id: 'h3',
      badge: '近期热门',
      badgeColor: 0xFFEF4444,
      title: '产后修复 · 燃脂',
      subtitle: '温和塑形 重启代谢',
      description:
          '以修复为前提的温和燃脂组合。先激活呼吸与骨盆底，再进行低冲击有氧，帮助在医生允许运动的前提下，安全重启代谢与核心力量。',
      imageAsset: ImageAssets.run1,
      imageUrl: ImageAssets.pexelsRun,
      level: '恢复温和',
      totalMinutes: 25,
      calories: 165,
      participants: 203000,
      rating: 4.8,
      reasons: const [
        '低冲击，不追求暴汗与心率峰值',
        '先修复再燃脂，顺序科学',
        '每节可单独完成，状态不好也能练',
      ],
      sessions: const [
        HotPlanSessionItem(name: '呼吸激活', duration: '10 分钟', intensity: '轻柔'),
        HotPlanSessionItem(name: '温和有氧', duration: '15 分钟', intensity: '轻松'),
      ],
      suitableFor: '产后恢复（请遵医嘱）',
      testimonial: '「节奏很舒服，没有压迫感。」— 恢复期妈妈常选',
    ),
  };

  static final Map<String, HotPlanPrepInfo> _hotPlanPrepInfos = {
    'h1': HotPlanPrepInfo(
      planId: 'h1',
      prepTitle: '大体重开练准备室',
      prepSubtitle: '完成下方准备后，再进入 34 分钟站立燃脂',
      sceneOptions: const ['客厅 / 卧室', '健身房', '办公室空地'],
      checklist: const [
        HotPlanPrepCheckItem(
          label: '运动鞋已穿好',
          hint: '选缓冲较好的鞋，减少膝关节压力',
          icon: Icons.directions_run,
        ),
        HotPlanPrepCheckItem(
          label: '身边有一杯水',
          hint: '训练中少量多次补水',
          icon: Icons.water_drop_outlined,
        ),
        HotPlanPrepCheckItem(
          label: '周围约 2㎡ 空地',
          hint: '确保可原地踏步、侧步',
          icon: Icons.square_foot,
        ),
        HotPlanPrepCheckItem(
          label: '膝关节无急性疼痛',
          hint: '若不适请先休息或降低强度',
          icon: Icons.healing_outlined,
        ),
        HotPlanPrepCheckItem(
          label: '已关闭手机通知',
          hint: '减少中断，保持心率稳定',
          icon: Icons.notifications_off_outlined,
        ),
      ],
      warmUpSteps: const [
        '原地慢走 60 秒，肩背放松',
        '踝关节绕环 各 8 次（内外）',
        '髋部画圈 左右各 6 次',
        '深呼吸 4 次，吸气 4 秒 / 呼气 6 秒',
      ],
      sessionDetails: const [
        HotPlanPrepSessionDetail(
          name: '关节唤醒',
          duration: '12 分钟',
          intensity: '轻松',
          focus: '激活踝、膝、髋，提升体温',
          heartRateZone: '最大心率 50%–60%',
          keyMoves: ['原地踏步', '侧向跨步', '手臂环绕', '小腿拉伸'],
        ),
        HotPlanPrepSessionDetail(
          name: '站立燃脂主课',
          duration: '22 分钟',
          intensity: '适中',
          focus: '维持燃脂心率，全程无跳跃',
          heartRateZone: '最大心率 60%–70%',
          keyMoves: ['站姿交替提膝', '慢速波比（无跳）', '开合步（低幅）', '放松走'],
        ),
      ],
      safetyNotes: const [
        '全程保持可说话的气喘程度，不要憋气',
        '膝盖不适时改为更小幅度或跳过该动作',
        '结束后做 3 分钟走路冷身',
      ],
      gearSuggestions: const ['运动鞋', '瑜伽垫（可选）', '毛巾'],
      coachTips: const {
        '精神好': '状态不错！第二环节可跟完全程，注意落地轻柔。',
        '一般': '按自己的节奏来，第二环节觉得累就放慢 20%。',
        '疲惫': '今天以唤醒为主，主课可只做 12 分钟，量力而行。',
      },
    ),
    'h2': HotPlanPrepInfo(
      planId: 'h2',
      prepTitle: '宿舍开练准备室',
      prepSubtitle: '23 分钟无器械组合 · 确认场景后即可开始',
      sceneOptions: const ['宿舍', '寝室楼道', '校园操场'],
      checklist: const [
        HotPlanPrepCheckItem(
          label: '铺好瑜伽垫或毛巾',
          hint: '避免赤脚打滑',
          icon: Icons.layers_outlined,
        ),
        HotPlanPrepCheckItem(
          label: '确认楼下可接受轻噪音',
          hint: 'HIIT 环节避免大力跺脚',
          icon: Icons.volume_down_outlined,
        ),
        HotPlanPrepCheckItem(
          label: '书桌椅子已挪开',
          hint: '预留手臂上举空间',
          icon: Icons.chair_alt_outlined,
        ),
        HotPlanPrepCheckItem(
          label: '穿戴运动服',
          hint: '宽松透气即可',
          icon: Icons.checkroom_outlined,
        ),
      ],
      warmUpSteps: const [
        '颈部左右轻缓拉伸 各 15 秒',
        '猫牛式 8 次（四足或站姿改良）',
        '高抬腿原地 30 秒（低幅）',
        '开合跳 20 秒（轻落地）',
      ],
      sessionDetails: const [
        HotPlanPrepSessionDetail(
          name: '身体唤醒',
          duration: '8 分钟',
          intensity: '轻松',
          focus: '唤醒肩背与核心，避免突然高强度',
          heartRateZone: '最大心率 55%–65%',
          keyMoves: ['站姿猫伸展', '髋部摆动', '平板支撑（膝着地）'],
        ),
        HotPlanPrepSessionDetail(
          name: '宿舍 HIIT',
          duration: '15 分钟',
          intensity: '适中',
          focus: '4 组循环，工作 40 秒 / 休息 20 秒',
          heartRateZone: '最大心率 65%–75%',
          keyMoves: ['深蹲', '俯身支撑交替提膝', '登山跑（慢）', '臀桥'],
        ),
      ],
      safetyNotes: const [
        '注意宿舍层高，跳跃类动作改為垫脚版',
        '组间休息务必喝两口水',
        '练完拉伸小腿与髋屈肌，缓解久坐',
      ],
      gearSuggestions: const ['瑜伽垫', '水杯', '耳机（可选）'],
      coachTips: const {
        '精神好': '可以把 HIIT 组数做满，最后一组再提速 10%。',
        '一般': 'HIIT 做 3 组即可，组间多休息 10 秒。',
        '疲惫': '只做唤醒环节也有效，HIIT 可改為慢速深蹲循环。',
      },
    ),
    'h3': HotPlanPrepInfo(
      planId: 'h3',
      prepTitle: '产后温和开练准备室',
      prepSubtitle: '请先确认医生允许运动，再进入本节',
      sceneOptions: const ['卧室', '客厅', '产后修复中心'],
      checklist: const [
        HotPlanPrepCheckItem(
          label: '已获医生运动许可',
          hint: '若有不适立即停止',
          icon: Icons.medical_services_outlined,
        ),
        HotPlanPrepCheckItem(
          label: '穿着支撑性内衣',
          hint: '减少胸部与腹部牵拉不适',
          icon: Icons.spa_outlined,
        ),
        HotPlanPrepCheckItem(
          label: '准备好抱枕或瑜伽砖',
          hint: '用于支撑与垫高',
          icon: Icons.chair_outlined,
        ),
        HotPlanPrepCheckItem(
          label: '宝宝已安顿好',
          hint: '确保 25 分钟不被打断',
          icon: Icons.child_care_outlined,
        ),
      ],
      warmUpSteps: const [
        '腹式呼吸 90 秒（手放肋骨两侧）',
        '骨盆前后倾 10 次（幅度小）',
        '猫牛式 6 次（极慢）',
        '侧卧 clamshell 每侧 8 次',
      ],
      sessionDetails: const [
        HotPlanPrepSessionDetail(
          name: '呼吸激活',
          duration: '10 分钟',
          intensity: '轻柔',
          focus: '重建呼吸与骨盆底连接',
          heartRateZone: '最大心率 50% 以下',
          keyMoves: ['仰卧腹式呼吸', '死虫式（小幅度）', '骨盆时钟'],
        ),
        HotPlanPrepSessionDetail(
          name: '温和有氧',
          duration: '15 分钟',
          intensity: '轻松',
          focus: '低冲击有氧，微微发热即可',
          heartRateZone: '最大心率 55%–65%',
          keyMoves: ['原地慢走', '站姿侧抬腿', '手臂画圈', '拉伸收束'],
        ),
      ],
      safetyNotes: const [
        '禁止卷腹、跳跃与高腹压动作',
        '出现疼痛、头晕、漏尿请立即停止',
        '以「舒适可说话」为强度上限',
      ],
      gearSuggestions: const ['瑜伽垫', '抱枕', '薄毯'],
      coachTips: const {
        '精神好': '状态稳定可完成两节，第二环节保持轻松有氧即可。',
        '一般': '按提示呼吸，第二环节可缩短 5 分钟。',
        '疲惫': '今天只做呼吸激活也计入打卡，不要勉强。',
      },
    ),
  };

  static List<FitnessPlanCard> get fitnessPlanCards => const [
        FitnessPlanCard(
          id: 'p1',
          title: '个性定制训练计划',
          description: '1 分钟问卷评估 · 1,980 万人练过',
          imageAsset: ImageAssets.indoorRide,
          imageUrl: ImageAssets.pexelsCardio,
          isSmartCustom: true,
        ),
        FitnessPlanCard(
          id: 'p2',
          title: '10 天冲刺 · 极速燃脂计划',
          description: '全程站立 疯狂燃脂 快速瘦身 · 87 万人练过',
          imageAsset: ImageAssets.ropeHero,
          imageUrl: ImageAssets.pexelsFatBurn,
          isSmartCustom: true,
        ),
        FitnessPlanCard(
          id: 'p3',
          title: '28 天马甲线养成计划',
          description: '腰腹专项 每日打卡 · 126 万人练过',
          imageAsset: ImageAssets.feedGym,
          imageUrl: ImageAssets.pexelsGym,
        ),
        FitnessPlanCard(
          id: 'p4',
          title: '晨间空腹有氧计划',
          description: '唤醒代谢 稳定食欲 · 54 万人练过',
          imageAsset: ImageAssets.walkHero,
          imageUrl: ImageAssets.pexelsWalk,
        ),
      ];

  static FitnessPlanDetail fitnessPlanDetail(String id, {String? userName}) {
    if (id == 'featured') {
      return _featuredDetail(userName ?? defaultProfile.name);
    }
    return _fitnessPlanDetails[id] ?? _defaultFitnessDetail(id);
  }

  static FitnessPlanDetail _featuredDetail(String userName) => FitnessPlanDetail(
        id: 'featured',
        title: '28 天代谢唤醒 · 温和减脂计划',
        subtitle: '不节食也能瘦 · 每天动一点，身体会感谢你',
        description:
            '为 $userName 定制的 28 天轻盈燃脂方案，以低冲击有氧与核心训练为主，循序渐进提升代谢，无需极端节食，适合希望温和减脂、养成运动习惯的伙伴。',
        imageAsset: ImageAssets.run1,
        imageUrl: ImageAssets.pexelsBrightWorkout,
        duration: '28 天',
        level: '入门 · 温和',
        dailyCalories: 320,
        participants: 128000,
        rating: 4.9,
        schedule: const [
          PlanDayPreview(
            dayLabel: '第 1 天',
            sessions: ['10 分钟晨间唤醒操', '18 分钟低冲击有氧'],
          ),
          PlanDayPreview(
            dayLabel: '第 2 天',
            sessions: ['12 分钟核心激活', '15 分钟快乐跳绳'],
          ),
          PlanDayPreview(
            dayLabel: '第 3 天',
            sessions: ['休息日 · 拉伸 8 分钟'],
          ),
          PlanDayPreview(
            dayLabel: '第 4 天',
            sessions: ['20 分钟快走燃脂', '10 分钟腹肌入门'],
          ),
          PlanDayPreview(
            dayLabel: '第 5 天',
            sessions: ['15 分钟 HIIT 入门', '12 分钟放松拉伸'],
          ),
          PlanDayPreview(
            dayLabel: '第 6-7 天',
            sessions: ['重复第 1-2 天内容 · 巩固习惯'],
          ),
        ],
        highlights: const ['温和不节食', '低冲击护膝', '28 天打卡'],
        suitableFor: '减脂入门 / 大体重友好',
      );

  static FitnessPlanDetail _defaultFitnessDetail(String id) => FitnessPlanDetail(
        id: id,
        title: '训练计划',
        subtitle: '科学编排 · 循序渐进',
        description: '一套为你量身推荐的训练计划，坚持打卡即可看见变化。',
        imageAsset: ImageAssets.gym1,
        imageUrl: ImageAssets.pexelsGym,
        duration: '14 天',
        level: '适中',
        dailyCalories: 280,
        participants: 10000,
        rating: 4.7,
        schedule: const [
          PlanDayPreview(
            dayLabel: '第 1 天',
            sessions: ['15 分钟全身热身', '20 分钟主训练'],
          ),
        ],
        highlights: const ['科学燃脂', '适合新手'],
      );

  static final Map<String, FitnessPlanDetail> _fitnessPlanDetails = {
    'h1': FitnessPlanDetail(
      id: 'h1',
      title: '大体重 · 全身燃脂',
      subtitle: '零基础 不伤膝盖 巨暴汗',
      description:
          '专为 BMI 偏高伙伴设计，全程低冲击、无跳跃，保护膝关节的同时稳定拉高心率，配合饮食建议帮助安全降重。',
      imageAsset: ImageAssets.gym2,
      imageUrl: ImageAssets.pexelsAbs,
      duration: '21 天',
      level: '入门',
      dailyCalories: 380,
      participants: 456000,
      rating: 4.8,
      schedule: const [
        PlanDayPreview(dayLabel: '第 1 天', sessions: ['12 分钟关节热身', '22 分钟站立燃脂']),
        PlanDayPreview(dayLabel: '第 2 天', sessions: ['18 分钟低冲击有氧', '10 分钟拉伸']),
        PlanDayPreview(dayLabel: '第 3 天', sessions: ['休息日 · 散步 20 分钟']),
      ],
      highlights: const ['不伤膝盖', '全程站立', '大体重友好'],
      suitableFor: '零基础 / BMI 偏高',
    ),
    'h2': FitnessPlanDetail(
      id: 'h2',
      title: '学生专属 · 瘦全身',
      subtitle: '宿舍可练 每天 15 分钟',
      description:
          '利用碎片时间在宿舍完成，无需器械，结合 HIIT 与核心训练，帮助学生在繁忙学业中保持体态与精力。',
      imageAsset: ImageAssets.yoga1,
      imageUrl: ImageAssets.pexelsStretch,
      duration: '14 天',
      level: '入门',
      dailyCalories: 260,
      participants: 892000,
      rating: 4.9,
      isSmartCustom: true,
      schedule: const [
        PlanDayPreview(dayLabel: '第 1 天', sessions: ['8 分钟唤醒', '15 分钟宿舍 HIIT']),
        PlanDayPreview(dayLabel: '第 2 天', sessions: ['12 分钟核心', '8 分钟拉伸']),
      ],
      highlights: const ['宿舍可练', '无器械', '15 分钟/天'],
      suitableFor: '学生 / 时间紧张',
    ),
    'h3': FitnessPlanDetail(
      id: 'h3',
      title: '产后修复 · 燃脂',
      subtitle: '温和塑形 重启代谢',
      description:
          '针对产后恢复阶段，以骨盆底激活、腹横肌重建为主，配合温和有氧，在医生允许运动的前提下安全重启代谢。',
      imageAsset: ImageAssets.run1,
      imageUrl: ImageAssets.pexelsRun,
      duration: '28 天',
      level: '恢复 · 温和',
      dailyCalories: 240,
      participants: 203000,
      rating: 4.8,
      schedule: const [
        PlanDayPreview(dayLabel: '第 1 天', sessions: ['10 分钟呼吸激活', '12 分钟温和有氧']),
        PlanDayPreview(dayLabel: '第 2 天', sessions: ['15 分钟核心修复', '8 分钟放松']),
      ],
      highlights: const ['温和修复', '低冲击', '专业编排'],
      suitableFor: '产后恢复（遵医嘱）',
    ),
    'p1': FitnessPlanDetail(
      id: 'p1',
      title: '个性定制训练计划',
      subtitle: '1 分钟问卷评估 · 智能匹配',
      description:
          '完成 1 分钟身体评估问卷，系统将根据你的目标、时间与运动基础，生成专属周计划并动态调整强度。',
      imageAsset: ImageAssets.indoorRide,
      imageUrl: ImageAssets.pexelsCardio,
      duration: '按周更新',
      level: '智能适配',
      dailyCalories: 350,
      participants: 19800000,
      rating: 4.9,
      isSmartCustom: true,
      schedule: const [
        PlanDayPreview(dayLabel: '评估日', sessions: ['1 分钟问卷', '生成首周计划']),
        PlanDayPreview(dayLabel: '第 1 天', sessions: ['系统推荐 · 有氧 20 分钟']),
        PlanDayPreview(dayLabel: '第 2 天', sessions: ['系统推荐 · 力量 18 分钟']),
      ],
      highlights: const ['1 分钟评估', '动态调整', '千万人练过'],
      suitableFor: '所有目标与基础',
    ),
    'p2': FitnessPlanDetail(
      id: 'p2',
      title: '10 天冲刺 · 极速燃脂计划',
      subtitle: '全程站立 疯狂燃脂 快速瘦身',
      description:
          '10 天高密度间歇训练，全程站立无器械，适合短期冲刺减脂，建议有一定运动基础后参与。',
      imageAsset: ImageAssets.ropeHero,
      imageUrl: ImageAssets.pexelsFatBurn,
      duration: '10 天',
      level: '进阶',
      dailyCalories: 450,
      participants: 870000,
      rating: 4.7,
      isSmartCustom: true,
      schedule: const [
        PlanDayPreview(dayLabel: '第 1 天', sessions: ['25 分钟 HIIT 冲刺']),
        PlanDayPreview(dayLabel: '第 2 天', sessions: ['20 分钟站立燃脂', '10 分钟拉伸']),
        PlanDayPreview(dayLabel: '第 3 天', sessions: ['休息日 · 轻度活动']),
      ],
      highlights: const ['10 天冲刺', '全程站立', '高消耗'],
      suitableFor: '有运动基础',
    ),
    'p3': FitnessPlanDetail(
      id: 'p3',
      title: '28 天马甲线养成计划',
      subtitle: '腰腹专项 每日打卡',
      description:
          '28 天腰腹专项训练，从核心激活到腹肌雕刻循序渐进，配合饮食打卡，帮助塑造清晰马甲线线条。',
      imageAsset: ImageAssets.feedGym,
      imageUrl: ImageAssets.pexelsGym,
      duration: '28 天',
      level: '适中',
      dailyCalories: 300,
      participants: 1260000,
      rating: 4.8,
      schedule: const [
        PlanDayPreview(dayLabel: '第 1 天', sessions: ['10 分钟核心唤醒', '15 分钟腹肌入门']),
        PlanDayPreview(dayLabel: '第 2 天', sessions: ['12 分钟侧腹', '10 分钟拉伸']),
        PlanDayPreview(dayLabel: '第 4 天', sessions: ['18 分钟腹肌燃脂组合']),
      ],
      highlights: const ['腰腹专项', '每日打卡', '28 天周期'],
      suitableFor: '有一定核心基础',
    ),
    'p4': FitnessPlanDetail(
      id: 'p4',
      title: '晨间空腹有氧计划',
      subtitle: '唤醒代谢 稳定食欲',
      description:
          '利用晨间空腹窗口进行温和有氧，提升全天代谢水平，搭配简单拉伸，帮助稳定食欲、减少午后暴食。',
      imageAsset: ImageAssets.walkHero,
      imageUrl: ImageAssets.pexelsWalk,
      duration: '14 天',
      level: '入门',
      dailyCalories: 220,
      participants: 540000,
      rating: 4.8,
      schedule: const [
        PlanDayPreview(dayLabel: '第 1 天', sessions: ['20 分钟晨间快走', '5 分钟拉伸']),
        PlanDayPreview(dayLabel: '第 2 天', sessions: ['15 分钟空腹慢跑走', '8 分钟放松']),
      ],
      highlights: const ['晨间代谢', '低冲击', '稳定食欲'],
      suitableFor: '早起习惯养成',
    ),
  };
}
