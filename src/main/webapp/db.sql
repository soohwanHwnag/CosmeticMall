

-- 1. 회원 테이블

DROP TABLE member;

-- 회원 인덱스 [pk], 이름, 이메일, 메일 수신여부, 비밀번호, 휴대전화,
-- 우편번호(addr1), 주소(addr2), 상세주소(addr3), 가입일, 총 구매금액, 회원등급

CREATE TABLE member(
    member_idx          number(5) PRIMARY KEY,
    member_name        varchar2(50),
    member_email        varchar2(100),
    member_email_YN     varchar2(1),
    member_password     varchar2(50),
    member_phone        varchar2(20),
    member_addr1        varchar2(10),
    member_addr2        varchar2(100),
    member_addr3        varchar2(100),
    member_joindate     DATE DEFAULT sysdate,
    member_amount       number(10),
    member_grade        varchar2(15)
);

DROP SEQUENCE member_seq;

CREATE SEQUENCE member_seq;

INSERT INTO member (member_idx, member_name, member_email, member_email_YN, member_password, member_phone, 
                    member_addr1, member_addr2, member_addr3, member_joindate, member_amount, member_grade)
            VALUES (member_seq.nextval, '이름', '이메일', 'Y', '비밀번호', '전화번호', 
                    '11111', '주소', '상세주소', sysdate, 10000, '관리자');
INSERT INTO member (member_idx, member_name, member_email, member_email_YN, member_password, member_phone, 
                    member_addr1, member_addr2, member_addr3, member_joindate, member_amount, member_grade)
            VALUES (member_seq.nextval, '이름', '이메일', 'N', '비밀번호', '전화번호', 
                    '12345', '주소', '상세주소', sysdate, 50000, '일반회원');
            
SELECT * FROM member;
SELECT * FROM member ORDER BY member_idx DESC;


-- 2번 메일 테이블

DROP TABLE mail;

-- 메일 인덱스 [pk], 메일 종류, 메일 제목, 메일 콘텐츠, 자동발송여부

CREATE TABLE mail(
    mail_idx            number(5) PRIMARY KEY,
    mail_category       varchar2(30),
    mail_title          varchar2(100),
    mail_content        varchar2(4000),
    mail_auto_YN        varchar2(1)
);

DROP SEQUENCE mail_seq;

CREATE SEQUENCE mail_seq;

INSERT INTO mail (mail_idx, mail_category, mail_title, mail_content, mail_auto_YN)
            VALUES (mail_seq.nextval, '메일 종류', '메일 제목', '메일 콘텐츠', 'Y');
            
SELECT * FROM mail;


-- 3번 상품 테이블

DROP TABLE product;

-- 상품 인덱스 [pk], 상품 카테고리, 상품명, 한 줄 설명, 가격, 용량, 재고, 배송비(기본값),
-- 상세정보 콘텐츠, 진열상태, 상품 조회수, 상품 추가일

CREATE TABLE product(
    product_idx             number(5) PRIMARY KEY,
    product_category        varchar2(30),
    product_name            varchar2(100),
    product_comment         varchar2(300),
    product_price           number(10),
    product_volume          varchar2(10),
    product_stock           number(5),
    product_shipping_fee    number(5) DEFAULT 3000,
    product_content         varchar2(4000),
    product_display         varchar2(10),
    product_hit             number(5) DEFAULT 0,
    product_add_date        DATE DEFAULT sysdate
product_filename      varchar2(100),
product_filename_detail      varchar2(100),
);

DROP SEQUENCE product_seq;

CREATE SEQUENCE product_seq;

INSERT INTO product (product_idx, product_category, product_name, product_comment, product_price,
                    product_volume, product_stock, product_shipping_fee, product_content, product_display)
            VALUES (product_seq.nextval, '상품 카테고리', '상품명', '한 줄 설명', 15000,
                    '100ml', 100, DEFAULT, '상품 상세정보 콘텐츠', '진열');
INSERT INTO product (product_idx, product_category, product_name, product_comment, product_price,
                    product_volume, product_stock, product_shipping_fee, product_content, product_display)
            VALUES (product_seq.nextval, '상품 카테고리', '상품명', '한 줄 설명', 8000,
                    '50g', 100, 5000, '상품 상세정보 콘텐츠', '품절');
            
SELECT * FROM product;


-- 4번 상품이미지 테이블

DROP TABLE product_image;

-- 이미지 인덱스 [pk], 이미지 종류(대표/상세정보), 이미지 파일명, 상품 인덱스(3) [fk]

CREATE TABLE product_image(
    image_idx           number(5) PRIMARY KEY,
    image_category      varchar2(30),
    image_filename      varchar2(100),
    image_product_idx   number(5) NOT NULL
);

DROP SEQUENCE product_image_seq;

CREATE SEQUENCE product_image_seq;

INSERT INTO product_image (image_idx, image_category, image_filename, image_product_idx)
            VALUES (product_image_seq.nextval, '대표', '이미지 파일명', 1);
            
SELECT * FROM product_image;


-- 5번 장바구니 테이블

DROP TABLE cart;

-- 장바구니 인덱스 [pk], 상품 인덱스(3) [fk], 상품 수량, 회원 인덱스(1) [fk]

CREATE TABLE cart(
    cart_idx            number(5) PRIMARY KEY,
    cart_product_idx    number(5) NOT NULL,
    cart_count          number(5),
    cart_member_idx     number(5) NOT NULL
);

DROP SEQUENCE cart_seq;

CREATE SEQUENCE cart_seq;

INSERT INTO cart (cart_idx, cart_product_idx, cart_count, cart_member_idx)
            VALUES (cart_seq.nextval, 1, 1, 1);
            
SELECT * FROM cart;


-- 6번 주문 테이블

DROP TABLE order_list;

-- 주문 인덱스 [pk], 주문번호, 수령인, 연락처, 우편번호(addr1), 주소(addr2), 상세주소(addr3), 배송 메세지,
-- 총 배송비, 결제 방법, 결제 금액, 주문 날짜, 진행상태, 회원 인덱스(1) [fk] - 주문자

CREATE TABLE order_list(
    order_idx               number(5) PRIMARY KEY,
    order_number            varchar2(20),
    order_recipient         varchar2(50),
    order_phone             varchar2(20),
    order_addr1             varchar2(10),
    order_addr2             varchar2(100),
    order_addr3             varchar2(100),
    order_message           varchar2(300),
    order_shipping_fee      number(5),
    order_payment_method    varchar2(20),
    order_payment_amount    number(10),
    order_date              DATE DEFAULT sysdate,
    order_status            varchar2(20),
    order_member_idx        number(5) NOT NULL
);

DROP SEQUENCE order_list_seq;

CREATE SEQUENCE order_list_seq;

INSERT INTO order_list (order_idx, order_number, order_recipient, order_phone, order_addr1, order_addr2, order_addr3,
                    order_message, order_shipping_fee, order_payment_method, order_payment_amount, order_status, order_member_idx)
            VALUES (order_list_seq.nextval, 20220202124125, '수령인', '연락처', '11111', '주소', '상세주소',
                    '배송 메세지', 3000 , '결제 방법', 35000 , '진행상태', 1);
            
SELECT * FROM order_list;


-- 7번 주문상품 테이블

DROP TABLE order_item;

-- 주문상품 인덱스 [pk], 상품 인덱스(3) [fk], 상품 금액, 수량, 배송비, 주문 인덱스(6) [fk]

CREATE TABLE order_item(
    item_idx            number(5) PRIMARY KEY,
    item_product_idx    number(5) NOT NULL,
    item_price          number(10),
    item_count          number(5),
    item_shipping_fee   number(5),
    item_order_idx      number(5) NOT NULL
);

DROP SEQUENCE order_item_seq;

CREATE SEQUENCE order_item_seq;

INSERT INTO order_item (item_idx, item_product_idx, item_price, item_count, item_shipping_fee, item_order_idx)
            VALUES (order_item_seq.nextval, 1, 35000, 1, 3000, 1);
            
SELECT * FROM order_item;


-- 8번 배송 테이블

DROP TABLE delivery;

-- 배송 인덱스 [pk], 택배사, 송장번호, 주문 인덱스(6) [fk]

CREATE TABLE delivery(
    delivery_idx                number(5) PRIMARY KEY,
    delivery_courier            varchar2(30),
    delivery_tracking_number    number(30),
    delivery_order_idx          number(5) NOT NULL
);

DROP SEQUENCE delivery_seq;

CREATE SEQUENCE delivery_seq;

INSERT INTO delivery (delivery_idx, delivery_courier, delivery_tracking_number, delivery_order_idx)
            VALUES (delivery_seq.nextval, '택배사', 488912095823, 1);
            
SELECT * FROM delivery;


--9번 리뷰 테이블

DROP TABLE review;

-- 리뷰 인덱스 [pk], 상품 인덱스(3) [fk], 스코어, 콘텐츠, 작성일, 주문상품 인덱스(7) [fk], 회원 인덱스(1) [fk]

CREATE TABLE review(
    review_idx            number(5) PRIMARY KEY,
    review_product_idx    number(5) NOT NULL,
    review_score          number(2, 1),
    review_content        varchar2(4000),
    review_date           DATE DEFAULT sysdate,
    review_item_idx       number(5) NOT NULL,
    review_member_idx     number(5) NOT NULL
);

DROP SEQUENCE review_seq;

CREATE SEQUENCE review_seq;

INSERT INTO review (review_idx, review_product_idx, review_score, review_content, review_item_idx, review_member_idx)
            VALUES (review_seq.nextval, 1, 3.5, '리뷰 콘텐츠', 1, 1);
            
SELECT * FROM review;


-- 10번 리뷰이미지 테이블

DROP TABLE review_image;

-- 리뷰 이미지 인덱스 [pk], 리뷰 이미지 파일명, 리뷰 인덱스(9) [fk]

CREATE TABLE review_image(
    image_idx           number(5) PRIMARY KEY,
    image_filename      varchar2(100),
    image_review_idx    number(5) NOT NULL
);

DROP SEQUENCE review_image_seq;

CREATE SEQUENCE review_image_seq;

INSERT INTO review_image (image_idx, image_filename, image_review_idx)
            VALUES (review_image_seq.nextval, '이미지 파일명', 1);
            
SELECT * FROM review_image;


-- 11번 주문취소 테이블

DROP TABLE order_cancel;

-- 주문취소 인덱스 [pk], 주문 취소일, 주문 인덱스(6) [fk]

CREATE TABLE order_cancel(
    cancel_idx          number(5) PRIMARY KEY,
    cancel_date         DATE DEFAULT sysdate,
    cancel_order_idx    number(5) NOT NULL
);

DROP SEQUENCE order_cancel_seq;

CREATE SEQUENCE order_cancel_seq;

INSERT INTO order_cancel (cancel_idx, cancel_order_idx)
            VALUES (order_cancel_seq.nextval, 1);
            
SELECT * FROM order_cancel;


-- 12번 교환/환불 테이블

DROP TABLE return;

-- 교환/환불 인덱스 [pk], 접수번호, 주문상품 인덱스(7) [fk], 교환/환불 수량, 교환/환불 선택, 사유, 상세 사유
-- 환불금액, 배송비 결제, 신청일자, 처리일자, 처리 상태, 주문 인덱스(6) [fk], 회원 인덱스(1) [fk] - 신청자

CREATE TABLE return(
    return_idx              number(5) PRIMARY KEY,
    return_number           varchar2(20),
    return_item_idx         number(5) NOT NULL,
    return_count            number(5),
    return_option           varchar2(10),
    return_reason           varchar2(20),
    return_reason_detail    varchar2(4000),
    return_refund           number(10),
    return_shipping_fee     number(5),
    return_request_date     DATE DEFAULT sysdate,
    return_process_date     DATE,
    return_status           varchar2(20),
    return_order_idx        number(5) NOT NULL,
    return_member_idx       number(5) NOT NULL
);

DROP SEQUENCE return_seq;

CREATE SEQUENCE return_seq;

INSERT INTO return (return_idx, return_number, return_item_idx, return_count, return_option, return_reason, return_reason_detail,
                    return_refund, return_shipping_fee, return_status, return_order_idx, return_member_idx)
            VALUES (return_seq.nextval, 20220202124125, 1, 1, '환불', '단순 변심', '상세 사유',
                    32000, 0, '환불신청', 1, 1);
            
SELECT * FROM return;


-- 13번 교환/환불이미지 테이블

DROP TABLE return_image;

-- 교환/환불 이미지 인덱스 [pk], 첨부파일 파일명, 교환/환불 인덱스(12) [fk]

CREATE TABLE return_image(
    image_idx           number(5) PRIMARY KEY,
    image_filename      varchar2(100),
    image_return_idx    number(5) NOT NULL
);

DROP SEQUENCE return_image_seq;

CREATE SEQUENCE return_image_seq;

INSERT INTO return_image (image_idx, image_filename, image_return_idx)
            VALUES (return_image_seq.nextval, '이미지 파일명', 1);
            
SELECT * FROM return_image;


-- 14번 자주하는 질문 테이블

DROP TABLE faq;

-- faq 인덱스 [pk], 카테고리, 질문, 답변, 회원 인덱스(1) [fk] - 작성자(관리자)

CREATE TABLE faq(
    faq_idx             number(5) PRIMARY KEY,
    faq_category        varchar2(30),
    faq_title           varchar2(100),
    faq_content         varchar2(4000),
    faq_member_idx      number(5) NOT NULL
);

DROP SEQUENCE faq_seq;

CREATE SEQUENCE faq_seq;

INSERT INTO faq (faq_idx, faq_category, faq_title, faq_content, faq_member_idx)
            VALUES (faq_seq.nextval, '카테고리', '질문', '답변', 1);
            
SELECT * FROM faq;


-- 15번 1:1문의 테이블

DROP TABLE one2one;

-- 1:1 인덱스 [pk], 카테고리, 제목, 내용, 작성일, 답변여부, 회원 인덱스(1) [fk] - 작성자

CREATE TABLE one2one(
    one2one_idx             number(5) PRIMARY KEY,
    one2one_category        varchar2(30),
    one2one_title           varchar2(100),
    one2one_content         varchar2(4000),
    one2one_date            DATE DEFAULT sysdate,
    one2one_reply_YN        varchar2(20) DEFAULT '미답변' ,
    one2one_member_idx      number(5) NOT NULL
);

DROP SEQUENCE one2one_seq;

CREATE SEQUENCE one2one_seq;

INSERT INTO one2one (one2one_idx, one2one_category, one2one_title, one2one_content, one2one_reply_YN, one2one_member_idx)
            VALUES (one2one_seq.nextval, '카테고리', '질문 제목', '질문 내용', 'N', 1);
            
SELECT * FROM one2one;


-- 16번 1:1문의 답변 테이블

DROP TABLE one2one_reply;

-- 1:1 답변 인덱스 [pk], 제목, 내용, 작성일, 회원인덱스(1) [fk] - 작성자(관리자), 1:1 인덱스(15) [fk]

CREATE TABLE one2one_reply(
    reply_idx               number(5) PRIMARY KEY,
    reply_title             varchar2(100),
    reply_content           varchar2(4000),
    reply_date              DATE DEFAULT sysdate,
    reply_member_idx        number(5) NOT NULL,
    reply_one2one_idx       number(5) NOT NULL
);

DROP SEQUENCE one2one_reply_seq;

CREATE SEQUENCE one2one_reply_seq;

INSERT INTO one2one_reply (reply_idx, reply_title, reply_content, reply_member_idx, reply_one2one_idx)
            VALUES (one2one_reply_seq.nextval, '답변 제목', '답변 내용', 1, 1);
            
SELECT * FROM one2one_reply;


-- 17번 공지사항 테이블

DROP TABLE notice;

-- 공지사항 인덱스 [pk], 제목, 내용, 작성일, 조회수, 중요공지 여부, 회원인덱스(1) [fk] - 작성자(관리자)

CREATE TABLE notice(
    notice_idx             number(5) PRIMARY KEY,
    notice_title           varchar2(100),
    notice_content         varchar2(4000),
    notice_date            DATE DEFAULT sysdate,
    notice_hit             number(5) DEFAULT 0,
    notice_important_YN    varchar2(1),
    notice_member_idx      number(5) NOT NULL
);

DROP SEQUENCE notice_seq;

CREATE SEQUENCE notice_seq;

INSERT INTO notice (notice_idx, notice_title, notice_content, notice_important_YN, notice_member_idx)
            VALUES (notice_seq.nextval, '제목', '내용', 'Y', 1);
            
SELECT * FROM notice;


-- 18번 이벤트 테이블

DROP TABLE event;

-- 이벤트 인덱스 [pk], 제목, 슬로건, 시작일, 종료일, 배너 파일명, 상세 이미지 파일명, 작성일, 조회수, 회원인덱스(1) [fk] - 작성자(관리자)

CREATE TABLE event(
    event_idx               number(5) PRIMARY KEY,
    event_title             varchar2(100),
    event_slogan            varchar2(100),
    event_start_date        DATE,
    event_end_date          DATE,
    event_banner_filename   varchar2(100),
    event_detail_filename   varchar2(100),
    event_date              DATE DEFAULT sysdate,
    event_hit               number(5) DEFAULT 0,
    event_member_idx        number(5) NOT NULL
    event_finish DEFAULT 'Y'
);

DROP SEQUENCE event_seq;

CREATE SEQUENCE event_seq;

INSERT INTO event (event_idx, event_title, event_slogan, event_start_date, event_end_date,
                    event_banner_filename, event_detail_filename, event_member_idx)
            VALUES (event_seq.nextval, '제목', '슬로건', '20220201', '20220301',
                    '배너 파일명', '상세 이미지 파일명', 1);
            
SELECT * FROM event;


SELECT * FROM event WHERE event_idx=1;

UPDATE event SET event_title='제목2', event_slogan='슬로건2'
                  WHERE event_idx=1;
                  
UPDATE event SET event_hit = event_hit+1 WHERE event_idx=1;
                        
DELETE FROM event WHERE member_idx=2;


commit;

