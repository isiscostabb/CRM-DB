PGDMP                      |            CRM-DB    16.3    16.3 *    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    40989    CRM-DB    DATABASE        CREATE DATABASE "CRM-DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "CRM-DB";
                postgres    false            �            1259    40990 	   avaliacao    TABLE     �   CREATE TABLE public.avaliacao (
    id_avaliacao integer NOT NULL,
    id_cliente integer NOT NULL,
    id_servico integer NOT NULL,
    nota numeric(10,0) NOT NULL,
    comentario character varying NOT NULL,
    data_avaliacao date NOT NULL
);
    DROP TABLE public.avaliacao;
       public         heap    postgres    false            �            1259    40995    clientes    TABLE     v  CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nome_cliente character varying(30) NOT NULL,
    email character varying(64) NOT NULL,
    telefone character varying(30) NOT NULL,
    endereco character varying(30) NOT NULL,
    cpf_cnpj character varying(20) NOT NULL,
    data_cadastro date NOT NULL,
    tipo_cliente character varying(50) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    40998    entrada    TABLE       CREATE TABLE public.entrada (
    id_entrada integer NOT NULL,
    id_cliente integer NOT NULL,
    data_entrada date NOT NULL,
    valor_entrada double precision NOT NULL,
    metodo_pagamento character varying(15) NOT NULL,
    obs character varying(30) NOT NULL
);
    DROP TABLE public.entrada;
       public         heap    postgres    false            �            1259    41001    funcionarios    TABLE     �  CREATE TABLE public.funcionarios (
    id_funcionario integer NOT NULL,
    nome_funcionario character varying(30) NOT NULL,
    cargo character varying(30) NOT NULL,
    email character varying(64) NOT NULL,
    telefone character varying(30) NOT NULL,
    data_contratacao date NOT NULL,
    prazo_contrato character varying(30) NOT NULL,
    genero character varying(15) NOT NULL,
    cpf character varying(20) NOT NULL,
    endereco character varying(30) NOT NULL
);
     DROP TABLE public.funcionarios;
       public         heap    postgres    false            �            1259    41019    historico_Uso    TABLE     �   CREATE TABLE public."historico_Uso" (
    id_historico integer NOT NULL,
    id_cliente integer NOT NULL,
    id_maquina integer NOT NULL,
    id_reserva integer NOT NULL
);
 #   DROP TABLE public."historico_Uso";
       public         heap    postgres    false            �            1259    41004    maquina    TABLE       CREATE TABLE public.maquina (
    "id_maquina " integer NOT NULL,
    id_cliente integer NOT NULL,
    tipo character varying(30) NOT NULL,
    status character varying(30) NOT NULL,
    hora_inicio time with time zone NOT NULL,
    hora_fim time with time zone NOT NULL
);
    DROP TABLE public.maquina;
       public         heap    postgres    false            �            1259    41007    movimento_financeiro    TABLE     �   CREATE TABLE public.movimento_financeiro (
    tabela_banco character varying(20) NOT NULL,
    acao character varying(20) NOT NULL,
    data date NOT NULL,
    hora time with time zone NOT NULL,
    usuario character varying(20) NOT NULL
);
 (   DROP TABLE public.movimento_financeiro;
       public         heap    postgres    false            �            1259    41010    reserva    TABLE     �   CREATE TABLE public.reserva (
    id_reserva integer NOT NULL,
    id_cliente integer NOT NULL,
    id_maquina integer NOT NULL,
    data_reserva date NOT NULL
);
    DROP TABLE public.reserva;
       public         heap    postgres    false            �            1259    41013    saida    TABLE     �   CREATE TABLE public.saida (
    id_saida integer NOT NULL,
    data_saida date NOT NULL,
    valor_saida double precision NOT NULL,
    obs character varying(30) NOT NULL
);
    DROP TABLE public.saida;
       public         heap    postgres    false            �            1259    41016    servico    TABLE     �   CREATE TABLE public.servico (
    id_servico integer NOT NULL,
    tipo_servico character varying(30) NOT NULL,
    descricao character varying(30),
    produtos character varying(30),
    valor double precision
);
    DROP TABLE public.servico;
       public         heap    postgres    false            �          0    40990 	   avaliacao 
   TABLE DATA           k   COPY public.avaliacao (id_avaliacao, id_cliente, id_servico, nota, comentario, data_avaliacao) FROM stdin;
    public          postgres    false    215   6       �          0    40995    clientes 
   TABLE DATA           ~   COPY public.clientes (id_cliente, nome_cliente, email, telefone, endereco, cpf_cnpj, data_cadastro, tipo_cliente) FROM stdin;
    public          postgres    false    216   56       �          0    40998    entrada 
   TABLE DATA           m   COPY public.entrada (id_entrada, id_cliente, data_entrada, valor_entrada, metodo_pagamento, obs) FROM stdin;
    public          postgres    false    217   R6       �          0    41001    funcionarios 
   TABLE DATA           �   COPY public.funcionarios (id_funcionario, nome_funcionario, cargo, email, telefone, data_contratacao, prazo_contrato, genero, cpf, endereco) FROM stdin;
    public          postgres    false    218   o6       �          0    41019    historico_Uso 
   TABLE DATA           [   COPY public."historico_Uso" (id_historico, id_cliente, id_maquina, id_reserva) FROM stdin;
    public          postgres    false    224   �6       �          0    41004    maquina 
   TABLE DATA           a   COPY public.maquina ("id_maquina ", id_cliente, tipo, status, hora_inicio, hora_fim) FROM stdin;
    public          postgres    false    219   �6       �          0    41007    movimento_financeiro 
   TABLE DATA           W   COPY public.movimento_financeiro (tabela_banco, acao, data, hora, usuario) FROM stdin;
    public          postgres    false    220   �6       �          0    41010    reserva 
   TABLE DATA           S   COPY public.reserva (id_reserva, id_cliente, id_maquina, data_reserva) FROM stdin;
    public          postgres    false    221   �6       �          0    41013    saida 
   TABLE DATA           G   COPY public.saida (id_saida, data_saida, valor_saida, obs) FROM stdin;
    public          postgres    false    222    7       �          0    41016    servico 
   TABLE DATA           W   COPY public.servico (id_servico, tipo_servico, descricao, produtos, valor) FROM stdin;
    public          postgres    false    223   7       >           2606    41023    avaliacao avaliacao_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT avaliacao_pkey PRIMARY KEY (id_avaliacao);
 B   ALTER TABLE ONLY public.avaliacao DROP CONSTRAINT avaliacao_pkey;
       public            postgres    false    215            @           2606    41025    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    216            B           2606    41027    entrada entrada_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT entrada_pkey PRIMARY KEY (id_entrada);
 >   ALTER TABLE ONLY public.entrada DROP CONSTRAINT entrada_pkey;
       public            postgres    false    217            D           2606    41029    funcionarios funcionarios_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id_funcionario);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public            postgres    false    218            N           2606    41041     historico_Uso historico_Uso_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."historico_Uso"
    ADD CONSTRAINT "historico_Uso_pkey" PRIMARY KEY (id_historico);
 N   ALTER TABLE ONLY public."historico_Uso" DROP CONSTRAINT "historico_Uso_pkey";
       public            postgres    false    224            F           2606    41031    maquina maquina_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.maquina
    ADD CONSTRAINT maquina_pkey PRIMARY KEY ("id_maquina ");
 >   ALTER TABLE ONLY public.maquina DROP CONSTRAINT maquina_pkey;
       public            postgres    false    219            H           2606    41035    reserva reserva_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id_reserva);
 >   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_pkey;
       public            postgres    false    221            J           2606    41037    saida saida_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.saida
    ADD CONSTRAINT saida_pkey PRIMARY KEY (id_saida);
 :   ALTER TABLE ONLY public.saida DROP CONSTRAINT saida_pkey;
       public            postgres    false    222            L           2606    41039    servico servico_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY (id_servico);
 >   ALTER TABLE ONLY public.servico DROP CONSTRAINT servico_pkey;
       public            postgres    false    223            R           2606    41042    maquina id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.maquina
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 ?   ALTER TABLE ONLY public.maquina DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    216    4672    219            Q           2606    41047    entrada id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 ?   ALTER TABLE ONLY public.entrada DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    217    4672    216            S           2606    41052    reserva id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 ?   ALTER TABLE ONLY public.reserva DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    221    216    4672            U           2606    41057    historico_Uso id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."historico_Uso"
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 G   ALTER TABLE ONLY public."historico_Uso" DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    224    216    4672            O           2606    41062    avaliacao id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 A   ALTER TABLE ONLY public.avaliacao DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    216    215    4672            T           2606    41067    reserva id_maquina_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT id_maquina_fk FOREIGN KEY (id_maquina) REFERENCES public.maquina("id_maquina ") NOT VALID;
 ?   ALTER TABLE ONLY public.reserva DROP CONSTRAINT id_maquina_fk;
       public          postgres    false    219    221    4678            V           2606    41072    historico_Uso id_maquina_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."historico_Uso"
    ADD CONSTRAINT id_maquina_fk FOREIGN KEY (id_maquina) REFERENCES public.maquina("id_maquina ") NOT VALID;
 G   ALTER TABLE ONLY public."historico_Uso" DROP CONSTRAINT id_maquina_fk;
       public          postgres    false    219    4678    224            W           2606    41077    historico_Uso id_reserva_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."historico_Uso"
    ADD CONSTRAINT id_reserva_fk FOREIGN KEY (id_reserva) REFERENCES public.reserva(id_reserva) NOT VALID;
 G   ALTER TABLE ONLY public."historico_Uso" DROP CONSTRAINT id_reserva_fk;
       public          postgres    false    4680    224    221            P           2606    41082    avaliacao id_servico_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT id_servico_fk FOREIGN KEY (id_servico) REFERENCES public.servico(id_servico) NOT VALID;
 A   ALTER TABLE ONLY public.avaliacao DROP CONSTRAINT id_servico_fk;
       public          postgres    false    215    223    4684            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     