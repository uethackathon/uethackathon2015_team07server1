Web API cho ứng dụng Lạc Sử - ứng dụng được xây dựng trong cuộc thi UET hackathon 2015

<div>
  <h1>I. Cài đặt</h1>
  <h3>Thêm repo của heroku</h3>
  <code>git remote add heroku https://git.heroku.com/your-app.git</code>
  <br>
  Ví dụ: uethackathon07
  <br>
  <code>git remote add heroku https://git.heroku.com/uethackathon07.git</code>
  <hr>

  <h3>Push code lên server heroku</h3>
  <code>git push heroku branch-name</code>
  <br>
  Ví dụ: master
  <br>
  <code>git push heroku master</code>
  <hr>

  <h3>Tạo db trên server heroku</h3>
  <code>heroku run rake db:create</code>
  <hr>

  <h3>Chạy các file trong thư mực db/migrate</h3>
  <code>heroku run rake db:migrate</code>
  <hr>

  <h3>Lấy dữ liệu lịch sử (tạm thời đang sử dụng của Wiki "Ngày này năm ấy")</h3>
  <code>heroku run rake db:crawl_data</code>
  <hr>

  <h3>Mở chạy ứng dụng</h3>
  <code>heroku open</code>
</div>

<div>
  <h1>II. Sử dụng</h1>
  <h3>Lấy json các dữ liệu lịch sử</h3>
  <code><a href="http://uethackathon07.herokuapp.com/api/histories">http://your-app.herokuapp.com/api/histories</a></code>
  <br>
  Ví dụ
  <br>
  <code><a href="http://uethackathon07.herokuapp.com/api/histories">http://uethackathon07.herokuapp.com/api/histories</a></code>
  <br>
  <code><a href="http://uethackathon07.herokuapp.com/api/histories">http://uethackathon07.herokuapp.com/api/histories</a></code>
  <hr>
  <h3>Lấy infographic lịch sử theo ngày tháng</h3>
  <code>http://your-app.herokuapp.com/api/pictures/<day>_<month></code>
  <br>
  Ví dụ ngày 21/12
  <br>
  <code><a href="http://uethackathon07.herokuapp.com/api/pictures/21_12">http://uethackathon07.herokuapp.com/api/pictures/21_12</a></code>
</div>