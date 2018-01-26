/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/1/26 16:11:30                           */
/*==============================================================*/


drop table if exists Message;

drop table if exists Post;

drop table if exists Users;

/*==============================================================*/
/* Table: Message                                               */
/*==============================================================*/
create table Message
(
   m_id                 integer(10) not null comment '����ID',
   m_u_id               integer(6) not null comment '�û�ID',
   m_rep_id             integer(10) comment '�ظ��Ķ��������ID',
   m_p_id               integer(6) not null comment '������������id',
   m_content            varchar(2000) not null comment '��������',
   m_pub_date           datetime not null comment '����ʱ��',
   primary key (m_id)
);

alter table Message comment '���Ա�';

/*==============================================================*/
/* Table: Post                                                  */
/*==============================================================*/
create table Post
(
   p_id                 integer(6) not null comment '����id',
   p_u_id               integer(6) not null comment '���������û�ID',
   p_content            varcahr(500) not null comment '������������',
   p_pub_date           datetime not null comment '����ʱ��',
   primary key (p_id)
);

alter table Post comment '���ӱ�';

/*==============================================================*/
/* Table: Users                                                 */
/*==============================================================*/
create table Users
(
   u_id                 integer(6) not null comment '�û�ID',
   u_name               varchar(10) not null comment '�û�����',
   u_sex                integer(1) not null comment '�û��Ա�',
   u_profile            varchar(500) comment '�û����',
   u_age                integer(2) not null comment '�û�����',
   primary key (u_id)
);

alter table Users comment '�û���';

alter table Message add constraint FK_Reference_2 foreign key (m_u_id)
      references Users (u_id) on delete restrict on update restrict;

alter table Message add constraint FK_Reference_3 foreign key (m_rep_id)
      references Message (m_id) on delete restrict on update restrict;

alter table Message add constraint FK_Reference_4 foreign key (m_p_id)
      references Post (p_id) on delete restrict on update restrict;

alter table Post add constraint FK_Reference_1 foreign key (p_u_id)
      references Users (u_id) on delete restrict on update restrict;

