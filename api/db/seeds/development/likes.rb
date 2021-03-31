# 全てのランキング用のseedデータ
# いいね数が段階的に1ずつ増えているlikeデータを作成
1.times{ create(:like, :for_seeds_user_1) }
2.times{ create(:like, :for_seeds_user_2) }
3.times{ create(:like, :for_seeds_user_3) }
4.times{ create(:like, :for_seeds_user_4) }
5.times{ create(:like, :for_seeds_user_5) }
6.times{ create(:like, :for_seeds_user_6) }
7.times{ create(:like, :for_seeds_user_7) }

# 週間のランキング用のseedデータ
1.times{ create(:like, :with_weekly, :for_seeds_user_11) }
2.times{ create(:like, :with_weekly, :for_seeds_user_12) }
3.times{ create(:like, :with_weekly, :for_seeds_user_13) }
4.times{ create(:like, :with_weekly, :for_seeds_user_14) }
5.times{ create(:like, :with_weekly, :for_seeds_user_15) }
6.times{ create(:like, :with_weekly, :for_seeds_user_16) }
7.times{ create(:like, :with_weekly, :for_seeds_user_17) }

# デイリーランキング用のseedデータ
1.times{ create(:like, :with_daily, :for_seeds_user_21) }
2.times{ create(:like, :with_daily, :for_seeds_user_22) }
3.times{ create(:like, :with_daily, :for_seeds_user_23) }
4.times{ create(:like, :with_daily, :for_seeds_user_24) }
5.times{ create(:like, :with_daily, :for_seeds_user_25) }
6.times{ create(:like, :with_daily, :for_seeds_user_26) }
7.times{ create(:like, :with_daily, :for_seeds_user_27) }
