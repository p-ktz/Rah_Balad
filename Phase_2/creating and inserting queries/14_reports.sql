USE rah_balad;

DROP TABLE IF EXISTS reports;

CREATE TABLE rah_balad.reports (
  reports_id BIGINT NOT NULL,
  user_id_that_reported CHAR(10) NOT NULL,
  user_resevation_id BIGINT NULL DEFAULT NULL,
  perceeding_status ENUM('Pending', 'InProgress', 'Resolved', 'Rejected') NOT NULL DEFAULT 'Pending',
  report_title VARCHAR(45) NULL DEFAULT NULL,
  report_description VARCHAR(255) NOT NULL,
  admin_response VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (reports_id),
  INDEX fk_reports_users1_idx (user_id_that_reported ASC) VISIBLE,
  INDEX fk_reports_reservation1_idx (user_resevation_id ASC) VISIBLE,
  CONSTRAINT fk_reports_users1
    FOREIGN KEY (user_id_that_reported)
    REFERENCES rah_balad.users (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_reports_reservation1
    FOREIGN KEY (user_resevation_id)
    REFERENCES rah_balad.reservations (reservation_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO rah_balad.reports (
  reports_id, user_id_that_reported, user_resevation_id, perceeding_status, report_title, report_description, admin_response
) VALUES
  (1, '1234567891', 1, 'Pending', 'مشکل در رزرو', 'رزرو من تایید شده ولی بلیت صادر نشد', NULL),
  (2, '0451237864', NULL, 'InProgress', 'سایت کند است', 'بارگذاری صفحات سایت خیلی طول می‌کشد.', 'در حال بررسی زیرساخت هستیم'),
  (3, '9876543210', 4, 'Resolved', 'لغو اشتباهی', 'رزرو من بدون اطلاع لغو شد.', 'رزرو مجدد انجام شد و هزینه بازگشت داده شد.'),
  (4, '2765018492', 5, 'Rejected', 'تخفیف اعمال نشد', 'کد تخفیف زدم ولی مبلغ کم نشد.', 'کد تخفیف شما منقضی شده بوده است.'),
  (5, '3620194786', 2, 'Pending', 'تاریخ اشتباه در بلیت', 'تاریخ سفر در بلیت با انتخاب من متفاوت است.', NULL);

SELECT * FROM reports;