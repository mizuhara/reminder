Delayed::Worker.max_attempts = 0
Delayed::Worker.delay_jobs = !Rails.env.test?
