USE rah_balad;

DROP TABLE IF EXISTS reports;

CREATE TABLE rah_balad.reports (
  reports_id BIGINT NOT NULL,
  user_id_that_reported CHAR(10) NOT NULL,
  user_reservation_id BIGINT NULL DEFAULT NULL,
  perceeding_status ENUM('Pending', 'InProgress', 'Resolved', 'Rejected') NOT NULL DEFAULT 'Pending',
  report_title VARCHAR(45) NULL DEFAULT NULL,
  report_description VARCHAR(255) NOT NULL,
  admin_response VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (reports_id),
  INDEX fk_reports_users1_idx (user_id_that_reported ASC) VISIBLE,
  INDEX fk_reports_reservation1_idx (user_reservation_id ASC) VISIBLE,
  CONSTRAINT fk_reports_users1
    FOREIGN KEY (user_id_that_reported)
    REFERENCES rah_balad.users (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_reports_reservation1
    FOREIGN KEY (user_reservation_id)
    REFERENCES rah_balad.reservations (reservation_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO rah_balad.reports (
  reports_id, user_id_that_reported, user_reservation_id, perceeding_status, report_title, report_description, admin_response
) VALUES
  (1, '1234567891', 1, 'Pending', 'مشکل در رزرو', 'رزرو من تایید شده ولی بلیت صادر نشد', NULL),
  (2, '0451237864', NULL, 'InProgress', 'سایت کند است', 'بارگذاری صفحات سایت خیلی طول می‌کشد.', 'در حال بررسی زیرساخت هستیم'),
  (3, '9876543210', 4, 'Resolved', 'لغو اشتباهی', 'رزرو من بدون اطلاع لغو شد.', 'رزرو مجدد انجام شد و هزینه بازگشت داده شد.'),
  (4, '2765018492', 5, 'Rejected', 'تخفیف اعمال نشد', 'کد تخفیف زدم ولی مبلغ کم نشد.', 'کد تخفیف شما منقضی شده بوده است.'),
  (5, '3620194786', 2, 'Pending', 'تاریخ اشتباه در بلیت', 'تاریخ سفر در بلیت با انتخاب من متفاوت است.', NULL),
  (6, '4444555566', 3, 'InProgress', 'تغییر صندلی', 'می‌خواستم صندلی عوض کنم ولی گزینه‌ای نبود.', NULL),
  (7, '5555666677', NULL, 'Pending', 'خطا در پرداخت', 'پرداخت انجام شد ولی تایید نشد.', NULL),
  (8, '1212121212', 1, 'Resolved', 'رزرو اشتباهی', 'به‌جای مقصد تهران، مقصد مشهد انتخاب شد.', 'هزینه برگشت داده شد و اصلاح شد.'),
  (9, '3434343434', 2, 'Rejected', 'اعمال چندباره تخفیف', 'دو بار تخفیف خواستم اعمال کنم نشد.', 'طبق قوانین فقط یک تخفیف مجاز است.'),
  (10, '5656565656', NULL, 'Pending', 'پشتیبانی پاسخ نمی‌دهد', 'تماس گرفتم ولی کسی پاسخ نداد.', NULL),
  (11, '8888999900', 4, 'InProgress', 'مشکل در اطلاعات بلیت', 'شماره تماس اشتباه درج شده.', NULL),
  (12, '9999000011', 5, 'Resolved', 'کنسلی بدون اطلاع', 'رزرو کنسل شد ولی من خبر نداشتم.', 'هزینه بازگردانده شد.'),
  (13, '3131313131', NULL, 'Pending', 'پیشنهاد بهبود', 'پیشنهاد می‌کنم امکان انتخاب راننده اضافه شود.', NULL),
  (14, '6464646464', NULL, 'Rejected', 'رابط کاربری ضعیف', 'سایت ظاهر مناسبی ندارد.', 'پیشنهاد شما به تیم طراحی منتقل شد.'),
  (15, '1212121212', 1, 'Pending', 'تاخیر در حرکت', 'وسیله‌ی نقلیه دیر رسید.', NULL),
  (16, '9090909090', NULL, 'InProgress', 'اختلال در سایت', 'سایت بعضی وقتا کار نمی‌کنه.', 'در حال رفع مشکل هستیم.'),
  (17, '7777888899', 2, 'Resolved', 'پرداخت دوبرابر', 'دو بار هزینه کم شد.', 'مبلغ دوم بازگردانده شد.'),
  (18, '6464646464', 3, 'Rejected', 'اعتراض به برخورد راننده', 'راننده محترمانه رفتار نکرد.', 'طبق بررسی، راننده خلافی نداشته است.'),
  (19, '5656565656', NULL, 'Pending', 'خطا در تاییدیه', 'ایمیل تایید دریافت نکردم.', NULL),
  (20, '3434343434', NULL, 'Pending', 'عدم تطابق زمان', 'ساعت اعلام‌شده با حرکت واقعی تفاوت داشت.', NULL);

SELECT * FROM reports;