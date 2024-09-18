PGDMP  !    4                |            Parcial1    16.4    16.4 $               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16633    Parcial1    DATABASE     �   CREATE DATABASE "Parcial1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE "Parcial1";
                postgres    false            �            1259    16706    citas    TABLE     �   CREATE TABLE public.citas (
    id_cita integer NOT NULL,
    id_usuario integer NOT NULL,
    id_medico integer NOT NULL,
    fecha_cita date NOT NULL,
    estado character varying(20) DEFAULT 'pendiente'::character varying NOT NULL
);
    DROP TABLE public.citas;
       public         heap    postgres    false            �            1259    16705    citas_id_cita_seq    SEQUENCE     �   CREATE SEQUENCE public.citas_id_cita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.citas_id_cita_seq;
       public          postgres    false    220                       0    0    citas_id_cita_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.citas_id_cita_seq OWNED BY public.citas.id_cita;
          public          postgres    false    219            �            1259    16724    examenes    TABLE     �   CREATE TABLE public.examenes (
    id_examen integer NOT NULL,
    tipo_examen character varying(100) NOT NULL,
    fecha_examen date NOT NULL,
    cedula character varying(20) NOT NULL
);
    DROP TABLE public.examenes;
       public         heap    postgres    false            �            1259    16723    examenes_id_examen_seq    SEQUENCE     �   CREATE SEQUENCE public.examenes_id_examen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.examenes_id_examen_seq;
       public          postgres    false    222                       0    0    examenes_id_examen_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.examenes_id_examen_seq OWNED BY public.examenes.id_examen;
          public          postgres    false    221            �            1259    16691    medicos    TABLE     �   CREATE TABLE public.medicos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    especialidad character varying(100) NOT NULL,
    telefono character varying(20) NOT NULL
);
    DROP TABLE public.medicos;
       public         heap    postgres    false            �            1259    16690    medicos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.medicos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.medicos_id_seq;
       public          postgres    false    218                       0    0    medicos_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.medicos_id_seq OWNED BY public.medicos.id;
          public          postgres    false    217            �            1259    16675    usuarios    TABLE     �  CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    cedula character varying(20) NOT NULL,
    email character varying(100) NOT NULL,
    telefono character varying(20) NOT NULL,
    password character varying(50) NOT NULL,
    ciudad character varying(200) NOT NULL,
    tipoafiliado character varying(20) NOT NULL,
    estadoafiliado character varying(20) NOT NULL,
    rol character varying(20) NOT NULL,
    CONSTRAINT usuarios_estadoafiliado_check CHECK (((estadoafiliado)::text = ANY ((ARRAY['activo'::character varying, 'inactivo'::character varying])::text[]))),
    CONSTRAINT usuarios_rol_check CHECK (((rol)::text = ANY ((ARRAY['cliente'::character varying, 'admin'::character varying])::text[]))),
    CONSTRAINT usuarios_tipoafiliado_check CHECK (((tipoafiliado)::text = ANY ((ARRAY['contributivo'::character varying, 'subsidiado'::character varying])::text[])))
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    16674    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    216                       0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    215            a           2604    16709    citas id_cita    DEFAULT     n   ALTER TABLE ONLY public.citas ALTER COLUMN id_cita SET DEFAULT nextval('public.citas_id_cita_seq'::regclass);
 <   ALTER TABLE public.citas ALTER COLUMN id_cita DROP DEFAULT;
       public          postgres    false    220    219    220            c           2604    16727    examenes id_examen    DEFAULT     x   ALTER TABLE ONLY public.examenes ALTER COLUMN id_examen SET DEFAULT nextval('public.examenes_id_examen_seq'::regclass);
 A   ALTER TABLE public.examenes ALTER COLUMN id_examen DROP DEFAULT;
       public          postgres    false    221    222    222            `           2604    16694 
   medicos id    DEFAULT     h   ALTER TABLE ONLY public.medicos ALTER COLUMN id SET DEFAULT nextval('public.medicos_id_seq'::regclass);
 9   ALTER TABLE public.medicos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            _           2604    16678    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            	          0    16706    citas 
   TABLE DATA           S   COPY public.citas (id_cita, id_usuario, id_medico, fecha_cita, estado) FROM stdin;
    public          postgres    false    220   �*                 0    16724    examenes 
   TABLE DATA           P   COPY public.examenes (id_examen, tipo_examen, fecha_examen, cedula) FROM stdin;
    public          postgres    false    222   �*                 0    16691    medicos 
   TABLE DATA           E   COPY public.medicos (id, nombre, especialidad, telefono) FROM stdin;
    public          postgres    false    218   =+                 0    16675    usuarios 
   TABLE DATA           �   COPY public.usuarios (id, nombre, apellido, cedula, email, telefono, password, ciudad, tipoafiliado, estadoafiliado, rol) FROM stdin;
    public          postgres    false    216   �+                  0    0    citas_id_cita_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.citas_id_cita_seq', 6, true);
          public          postgres    false    219                       0    0    examenes_id_examen_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.examenes_id_examen_seq', 5, true);
          public          postgres    false    221                       0    0    medicos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.medicos_id_seq', 12, true);
          public          postgres    false    217                       0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 9, true);
          public          postgres    false    215            p           2606    16712    citas citas_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id_cita);
 :   ALTER TABLE ONLY public.citas DROP CONSTRAINT citas_pkey;
       public            postgres    false    220            r           2606    16729    examenes examenes_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.examenes
    ADD CONSTRAINT examenes_pkey PRIMARY KEY (id_examen);
 @   ALTER TABLE ONLY public.examenes DROP CONSTRAINT examenes_pkey;
       public            postgres    false    222            n           2606    16696    medicos medicos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_pkey;
       public            postgres    false    218            h           2606    16687    usuarios usuarios_cedula_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cedula_key UNIQUE (cedula);
 F   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_cedula_key;
       public            postgres    false    216            j           2606    16689    usuarios usuarios_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_email_key;
       public            postgres    false    216            l           2606    16685    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    216            s           2606    16718    citas fk_medico    FK CONSTRAINT     r   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES public.medicos(id);
 9   ALTER TABLE ONLY public.citas DROP CONSTRAINT fk_medico;
       public          postgres    false    218    4718    220            t           2606    16713    citas fk_usuario    FK CONSTRAINT     u   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id);
 :   ALTER TABLE ONLY public.citas DROP CONSTRAINT fk_usuario;
       public          postgres    false    216    4716    220            	   J   x�3�4�44�4202�5��54�,H�K�L�+I�2�Y¥̐��qK��H�#I�r��Xf�$gԄ�!1z\\\ �(         D   x�3�4�4202�5��54�4426153���2��RF�HR&`6D��@� YΔ3--��&����� 4��         Z   x�5�K
�0 �ur1�����H�5%�������Ek�=�r�\r��q��zX��A�M�������p�<g6��բ�[o">zb         �   x�����0����!2��ě2�4a���/6%��Y�6]���n�kkL�Oyb�i�>QVC�����!l,���nA�Ԛ�e��d6;�狑ם\Y3T;�� ^�2H��/��A@qX�����7Ey�B�`��)P���'�x-�k�(��r�_.�y���n�v��3��*Vo�ً��e���x���e���%a�=o�     