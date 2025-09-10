CREATE SEQUENCE IF NOT EXISTS Adress_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS AuthUserRole_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS AuthUser_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS Facility_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS Image_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS Orders_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS Review_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS Roles_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS TypeOfHouse_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS Users_seq START WITH 1 INCREMENT BY 50;

CREATE TABLE Adress
(
    id         BIGINT       NOT NULL,
    street     VARCHAR(255) NOT NULL,
    city       VARCHAR(255) NOT NULL,
    country    VARCHAR(255) NOT NULL,
    postalCode VARCHAR(255) NOT NULL,
    CONSTRAINT pk_adress PRIMARY KEY (id)
);

CREATE TABLE AuthUser
(
    id       BIGINT       NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    user_id  BIGINT       NOT NULL,
    CONSTRAINT pk_authuser PRIMARY KEY (id)
);

CREATE TABLE AuthUserRole
(
    id     BIGINT NOT NULL,
    userId BIGINT NOT NULL,
    roleId BIGINT NOT NULL,
    CONSTRAINT pk_authuserrole PRIMARY KEY (id)
);

CREATE TABLE Facility
(
    id           BIGINT NOT NULL,
    facilityName VARCHAR(255),
    CONSTRAINT pk_facility PRIMARY KEY (id)
);

CREATE TABLE Image
(
    id       BIGINT NOT NULL,
    imageUrl VARCHAR(255),
    order_id BIGINT,
    CONSTRAINT pk_image PRIMARY KEY (id)
);

CREATE TABLE Orders
(
    id             BIGINT           NOT NULL,
    checkIn        date             NOT NULL,
    checkOut       date             NOT NULL,
    price          DOUBLE PRECISION NOT NULL,
    status         VARCHAR(255)     NOT NULL,
    user_id        BIGINT,
    typeOfHouse_id BIGINT,
    CONSTRAINT pk_orders PRIMARY KEY (id)
);

CREATE TABLE Review
(
    id           BIGINT       NOT NULL,
    rating       INTEGER      NOT NULL,
    comment      VARCHAR(500) NOT NULL,
    reviewerName VARCHAR(255) NOT NULL,
    createdAt    date         NOT NULL,
    user_id      BIGINT,
    order_id     BIGINT,
    CONSTRAINT pk_review PRIMARY KEY (id)
);

CREATE TABLE Roles
(
    id       BIGINT NOT NULL,
    roleName VARCHAR(255),
    CONSTRAINT pk_roles PRIMARY KEY (id)
);

CREATE TABLE TypeOfHouse
(
    id        BIGINT       NOT NULL,
    houseType VARCHAR(255) NOT NULL,
    CONSTRAINT pk_typeofhouse PRIMARY KEY (id)
);

CREATE TABLE Users
(
    id          BIGINT       NOT NULL,
    email       VARCHAR(255) NOT NULL,
    fullName    VARCHAR(255) NOT NULL,
    phoneNumber VARCHAR(255) NOT NULL,
    CONSTRAINT pk_users PRIMARY KEY (id)
);

CREATE TABLE authuser_roles
(
    authuser_id BIGINT NOT NULL,
    role_id     BIGINT NOT NULL
);

ALTER TABLE AuthUser
    ADD CONSTRAINT uc_authuser_user UNIQUE (user_id);

ALTER TABLE AuthUser
    ADD CONSTRAINT uc_authuser_username UNIQUE (username);

ALTER TABLE Review
    ADD CONSTRAINT uc_review_rating UNIQUE (rating);

ALTER TABLE Users
    ADD CONSTRAINT uc_users_email UNIQUE (email);

ALTER TABLE Users
    ADD CONSTRAINT uc_users_phonenumber UNIQUE (phoneNumber);

ALTER TABLE AuthUserRole
    ADD CONSTRAINT FK_AUTHUSERROLE_ON_ROLEID FOREIGN KEY (roleId) REFERENCES Roles (id);

ALTER TABLE AuthUserRole
    ADD CONSTRAINT FK_AUTHUSERROLE_ON_USERID FOREIGN KEY (userId) REFERENCES AuthUser (id);

ALTER TABLE AuthUser
    ADD CONSTRAINT FK_AUTHUSER_ON_USER FOREIGN KEY (user_id) REFERENCES Users (id);

ALTER TABLE Image
    ADD CONSTRAINT FK_IMAGE_ON_ORDER FOREIGN KEY (order_id) REFERENCES Orders (id);

ALTER TABLE Orders
    ADD CONSTRAINT FK_ORDERS_ON_TYPEOFHOUSE FOREIGN KEY (typeOfHouse_id) REFERENCES TypeOfHouse (id);

ALTER TABLE Orders
    ADD CONSTRAINT FK_ORDERS_ON_USER FOREIGN KEY (user_id) REFERENCES Users (id);

ALTER TABLE Review
    ADD CONSTRAINT FK_REVIEW_ON_ORDER FOREIGN KEY (order_id) REFERENCES Orders (id);

ALTER TABLE Review
    ADD CONSTRAINT FK_REVIEW_ON_USER FOREIGN KEY (user_id) REFERENCES Users (id);

ALTER TABLE authuser_roles
    ADD CONSTRAINT fk_autrol_on_auth_user FOREIGN KEY (authuser_id) REFERENCES AuthUser (id);

ALTER TABLE authuser_roles
    ADD CONSTRAINT fk_autrol_on_roles FOREIGN KEY (role_id) REFERENCES Roles (id);