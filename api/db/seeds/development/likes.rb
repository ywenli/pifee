# 全てのランキング用のseedデータ
# いいね数が段階的に1ずつ増えているlikeデータを作成
1.times{ create(:like, :for_seeds_user1) }
2.times{ create(:like, :for_seeds_user2) }
3.times{ create(:like, :for_seeds_user3) }
4.times{ create(:like, :for_seeds_user4) }
5.times{ create(:like, :for_seeds_user5) }
6.times{ create(:like, :for_seeds_user6) }
7.times{ create(:like, :for_seeds_user7) }

# 週間のランキング用のseedデータ
1.times{ create(:like, :with_weekly, :for_seeds_user11) }
2.times{ create(:like, :with_weekly, :for_seeds_user12) }
3.times{ create(:like, :with_weekly, :for_seeds_user13) }
4.times{ create(:like, :with_weekly, :for_seeds_user14) }
5.times{ create(:like, :with_weekly, :for_seeds_user15) }
6.times{ create(:like, :with_weekly, :for_seeds_user16) }
7.times{ create(:like, :with_weekly, :for_seeds_user17) }

# デイリーランキング用のseedデータ
1.times{ create(:like, :with_daily, :for_seeds_user21) }
2.times{ create(:like, :with_daily, :for_seeds_user22) }
3.times{ create(:like, :with_daily, :for_seeds_user23) }
4.times{ create(:like, :with_daily, :for_seeds_user24) }
5.times{ create(:like, :with_daily, :for_seeds_user25) }
6.times{ create(:like, :with_daily, :for_seeds_user26) }
7.times{ create(:like, :with_daily, :for_seeds_user27) }
