require 'test_helper'

class DbSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @db_schedule = db_schedules(:one)
  end

  test "should get index" do
    get db_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_db_schedule_url
    assert_response :success
  end

  test "should create db_schedule" do
    assert_difference('DbSchedule.count') do
      post db_schedules_url, params: { db_schedule: { location_id: @db_schedule.location_id, schedule_date: @db_schedule.schedule_date, schedule_type: @db_schedule.schedule_type, score: @db_schedule.score, team_id: @db_schedule.team_id } }
    end

    assert_redirected_to db_schedule_url(DbSchedule.last)
  end

  test "should show db_schedule" do
    get db_schedule_url(@db_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_db_schedule_url(@db_schedule)
    assert_response :success
  end

  test "should update db_schedule" do
    patch db_schedule_url(@db_schedule), params: { db_schedule: { location_id: @db_schedule.location_id, schedule_date: @db_schedule.schedule_date, schedule_type: @db_schedule.schedule_type, score: @db_schedule.score, team_id: @db_schedule.team_id } }
    assert_redirected_to db_schedule_url(@db_schedule)
  end

  test "should destroy db_schedule" do
    assert_difference('DbSchedule.count', -1) do
      delete db_schedule_url(@db_schedule)
    end

    assert_redirected_to db_schedules_url
  end
end
