require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it '開始日時が現在日時の16分後の場合は新規登録に成功する' do
    schedule = FactoryBot.build(:schedule)
    schedule.valid?
    expect(schedule).to be_valid
  end

  it '開始日時が現在日時の場合は新規登録に失敗する' do
    schedule = FactoryBot.build(:schedule, :start_now)
    schedule.valid?
    earliest_date_time = (DateTime.now + 15.minutes).to_s(:datetime)
    expect(schedule.errors[:start_date_time]).to include("は#{earliest_date_time}以降を指定してください")
  end

  it '開始日時が現在日時の15分後の場合は新規登録に失敗する' do
    schedule = FactoryBot.build(:schedule, :start_15minutes_from_now)
    schedule.valid?
    earliest_date_time = (DateTime.now + 15.minutes).to_s(:datetime)
    expect(schedule.errors[:start_date_time]).to include("は#{earliest_date_time}以降を指定してください")
  end

  it '開始日時が未指定の場合は新規登録に失敗する' do
    schedule = FactoryBot.build(:schedule, :start_nil)
    schedule.valid?
    earliest_date_time = (DateTime.now + 15.minutes).to_s(:datetime)
    expect(schedule.errors[:start_date_time]).to include("は#{earliest_date_time}以降を指定してください")
  end

  it '予定詳細が未指定の場合は新規登録に失敗する' do
    schedule = FactoryBot.build(:schedule, :detail_nil)
    schedule.valid?
    expect(schedule.errors[:detail]).to include("can't be blank")
  end
end
