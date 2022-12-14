PGDMP         !            
    z            shortapi    15.0    15.0 .    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            3           1262    16474    shortapi    DATABASE     ?   CREATE DATABASE "shortapi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE "shortapi";
                postgres    false            ?            1259    16525    failed_jobs    TABLE     @  CREATE TABLE "public"."failed_jobs" (
    "id" bigint NOT NULL,
    "uuid" character varying(255) NOT NULL,
    "connection" "text" NOT NULL,
    "queue" "text" NOT NULL,
    "payload" "text" NOT NULL,
    "exception" "text" NOT NULL,
    "failed_at" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 #   DROP TABLE "public"."failed_jobs";
       public         heap    postgres    false            ?            1259    16524    failed_jobs_id_seq    SEQUENCE        CREATE SEQUENCE "public"."failed_jobs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE "public"."failed_jobs_id_seq";
       public          postgres    false    224            4           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE "public"."failed_jobs_id_seq" OWNED BY "public"."failed_jobs"."id";
          public          postgres    false    223            ?            1259    16476 
   migrations    TABLE     ?   CREATE TABLE "public"."migrations" (
    "id" integer NOT NULL,
    "migration" character varying(255) NOT NULL,
    "batch" integer NOT NULL
);
 "   DROP TABLE "public"."migrations";
       public         heap    postgres    false            ?            1259    16475    migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."migrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE "public"."migrations_id_seq";
       public          postgres    false    215            5           0    0    migrations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE "public"."migrations_id_seq" OWNED BY "public"."migrations"."id";
          public          postgres    false    214            ?            1259    16518    password_resets    TABLE     ?   CREATE TABLE "public"."password_resets" (
    "email" character varying(255) NOT NULL,
    "token" character varying(255) NOT NULL,
    "created_at" timestamp(0) without time zone
);
 '   DROP TABLE "public"."password_resets";
       public         heap    postgres    false            ?            1259    16483    personal_access_tokens    TABLE     ?  CREATE TABLE "public"."personal_access_tokens" (
    "id" bigint NOT NULL,
    "tokenable_type" character varying(255) NOT NULL,
    "tokenable_id" bigint NOT NULL,
    "name" character varying(255) NOT NULL,
    "token" character varying(64) NOT NULL,
    "abilities" "text",
    "last_used_at" timestamp(0) without time zone,
    "expires_at" timestamp(0) without time zone,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone
);
 .   DROP TABLE "public"."personal_access_tokens";
       public         heap    postgres    false            ?            1259    16482    personal_access_tokens_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."personal_access_tokens_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE "public"."personal_access_tokens_id_seq";
       public          postgres    false    217            6           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE "public"."personal_access_tokens_id_seq" OWNED BY "public"."personal_access_tokens"."id";
          public          postgres    false    216            ?            1259    16495 	   shorturls    TABLE       CREATE TABLE "public"."shorturls" (
    "id" integer NOT NULL,
    "url" character varying(255) NOT NULL,
    "slug" character varying(255) NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone,
    "user_id" character varying
);
 !   DROP TABLE "public"."shorturls";
       public         heap    postgres    false            ?            1259    16494    shorturls_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."shorturls_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE "public"."shorturls_id_seq";
       public          postgres    false    219            7           0    0    shorturls_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE "public"."shorturls_id_seq" OWNED BY "public"."shorturls"."id";
          public          postgres    false    218            ?            1259    16508    users    TABLE     ?  CREATE TABLE "public"."users" (
    "id" bigint NOT NULL,
    "name" character varying(255) NOT NULL,
    "email" character varying(255) NOT NULL,
    "email_verified_at" timestamp(0) without time zone,
    "password" character varying(255) NOT NULL,
    "remember_token" character varying(100),
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone
);
    DROP TABLE "public"."users";
       public         heap    postgres    false            ?            1259    16507    users_id_seq    SEQUENCE     y   CREATE SEQUENCE "public"."users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE "public"."users_id_seq";
       public          postgres    false    221            8           0    0    users_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE "public"."users_id_seq" OWNED BY "public"."users"."id";
          public          postgres    false    220            ?           2604    16528    failed_jobs id    DEFAULT     ~   ALTER TABLE ONLY "public"."failed_jobs" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."failed_jobs_id_seq"'::"regclass");
 C   ALTER TABLE "public"."failed_jobs" ALTER COLUMN "id" DROP DEFAULT;
       public          postgres    false    223    224    224            }           2604    16479    migrations id    DEFAULT     |   ALTER TABLE ONLY "public"."migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."migrations_id_seq"'::"regclass");
 B   ALTER TABLE "public"."migrations" ALTER COLUMN "id" DROP DEFAULT;
       public          postgres    false    215    214    215            ~           2604    16486    personal_access_tokens id    DEFAULT     ?   ALTER TABLE ONLY "public"."personal_access_tokens" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."personal_access_tokens_id_seq"'::"regclass");
 N   ALTER TABLE "public"."personal_access_tokens" ALTER COLUMN "id" DROP DEFAULT;
       public          postgres    false    216    217    217                       2604    16498    shorturls id    DEFAULT     z   ALTER TABLE ONLY "public"."shorturls" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."shorturls_id_seq"'::"regclass");
 A   ALTER TABLE "public"."shorturls" ALTER COLUMN "id" DROP DEFAULT;
       public          postgres    false    218    219    219            ?           2604    16511    users id    DEFAULT     r   ALTER TABLE ONLY "public"."users" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."users_id_seq"'::"regclass");
 =   ALTER TABLE "public"."users" ALTER COLUMN "id" DROP DEFAULT;
       public          postgres    false    221    220    221            -          0    16525    failed_jobs 
   TABLE DATA                 public          postgres    false    224   ?5       $          0    16476 
   migrations 
   TABLE DATA                 public          postgres    false    215   ?5       +          0    16518    password_resets 
   TABLE DATA                 public          postgres    false    222   ?6       &          0    16483    personal_access_tokens 
   TABLE DATA                 public          postgres    false    217   7       (          0    16495 	   shorturls 
   TABLE DATA                 public          postgres    false    219   7       *          0    16508    users 
   TABLE DATA                 public          postgres    false    221   ?7       9           0    0    failed_jobs_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('"public"."failed_jobs_id_seq"', 1, false);
          public          postgres    false    223            :           0    0    migrations_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"public"."migrations_id_seq"', 5, true);
          public          postgres    false    214            ;           0    0    personal_access_tokens_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('"public"."personal_access_tokens_id_seq"', 1, false);
          public          postgres    false    216            <           0    0    shorturls_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('"public"."shorturls_id_seq"', 6, true);
          public          postgres    false    218            =           0    0    users_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"public"."users_id_seq"', 1, true);
          public          postgres    false    220            ?           2606    16533    failed_jobs failed_jobs_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "public"."failed_jobs"
    ADD CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id");
 L   ALTER TABLE ONLY "public"."failed_jobs" DROP CONSTRAINT "failed_jobs_pkey";
       public            postgres    false    224            ?           2606    16535 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     f   ALTER TABLE ONLY "public"."failed_jobs"
    ADD CONSTRAINT "failed_jobs_uuid_unique" UNIQUE ("uuid");
 S   ALTER TABLE ONLY "public"."failed_jobs" DROP CONSTRAINT "failed_jobs_uuid_unique";
       public            postgres    false    224            ?           2606    16481    migrations migrations_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY "public"."migrations"
    ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");
 J   ALTER TABLE ONLY "public"."migrations" DROP CONSTRAINT "migrations_pkey";
       public            postgres    false    215            ?           2606    16490 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY "public"."personal_access_tokens"
    ADD CONSTRAINT "personal_access_tokens_pkey" PRIMARY KEY ("id");
 b   ALTER TABLE ONLY "public"."personal_access_tokens" DROP CONSTRAINT "personal_access_tokens_pkey";
       public            postgres    false    217            ?           2606    16493 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     ~   ALTER TABLE ONLY "public"."personal_access_tokens"
    ADD CONSTRAINT "personal_access_tokens_token_unique" UNIQUE ("token");
 j   ALTER TABLE ONLY "public"."personal_access_tokens" DROP CONSTRAINT "personal_access_tokens_token_unique";
       public            postgres    false    217            ?           2606    16502    shorturls shorturls_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY "public"."shorturls"
    ADD CONSTRAINT "shorturls_pkey" PRIMARY KEY ("id");
 H   ALTER TABLE ONLY "public"."shorturls" DROP CONSTRAINT "shorturls_pkey";
       public            postgres    false    219            ?           2606    16517    users users_email_unique 
   CONSTRAINT     \   ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_email_unique" UNIQUE ("email");
 H   ALTER TABLE ONLY "public"."users" DROP CONSTRAINT "users_email_unique";
       public            postgres    false    221            ?           2606    16515    users users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
 @   ALTER TABLE ONLY "public"."users" DROP CONSTRAINT "users_pkey";
       public            postgres    false    221            ?           1259    16523    password_resets_email_index    INDEX     b   CREATE INDEX "password_resets_email_index" ON "public"."password_resets" USING "btree" ("email");
 3   DROP INDEX "public"."password_resets_email_index";
       public            postgres    false    222            ?           1259    16491 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     ?   CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" ON "public"."personal_access_tokens" USING "btree" ("tokenable_type", "tokenable_id");
 P   DROP INDEX "public"."personal_access_tokens_tokenable_type_tokenable_id_index";
       public            postgres    false    217    217            -   
   x???          $   ?   x????N?0??}?(?mR??,???vء\?45,?*N????{???}??O????IT?ӣ?]_?????o?f[?b)}#K?w??fw?+??{x??J??
?4?A5?Kd3aG?ckZ??s??v??(??E5O}???
׀p??????r?¼????Y??EY]?{??|T3??Y毘LĔ??{}????'?W?5??)?(????E      +   
   x???          &   
   x???          (   ?   x???v
Q???WP*(M??LV?S*??/*)-?)VR?P?LQ?QP?@TqNi:?N.JM,IM?O,K? ??S?⁺4?}B]?4?t?3JJ
????S???sA?:P4??"?*;#?6202?54?50Q0??21?20?#l??i??? ??4<      *   ?   x?u?OO?@??|?͆?6i7??S/?ImP????Y`??݂?Њ?^ ???̛??y3??f?
??	??Nw*????h?U?G牢NAK?;5??zU?'??`)?=?OРS0IU|??#?Y?v?2?????&\?"4`#?I?{????J?B?H?ð5\޸??~?Ϳ?|??A????SB?|~`g??8.?????????F?????)?c?Ɣ#:?^?Sʼ???q??FS?     