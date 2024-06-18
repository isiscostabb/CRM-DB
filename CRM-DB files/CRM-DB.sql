PGDMP                      |            CRM-DB    16.3    16.3 +    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24576    CRM-DB    DATABASE        CREATE DATABASE "CRM-DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "CRM-DB";
                postgres    false            �            1259    24622 	   Avaliacao    TABLE     �   CREATE TABLE public."Avaliacao" (
    id_avaliacao integer NOT NULL,
    id_cliente integer NOT NULL,
    id_servico integer NOT NULL,
    nota numeric(10,0) NOT NULL,
    comentario character varying NOT NULL,
    data_avaliacao date NOT NULL
);
    DROP TABLE public."Avaliacao";
       public         heap    postgres    false            �            1259    24577    Clientes    TABLE     x  CREATE TABLE public."Clientes" (
    id_cliente integer NOT NULL,
    nome_cliente character varying(30) NOT NULL,
    email character varying(64) NOT NULL,
    telefone character varying(30) NOT NULL,
    endereco character varying(30) NOT NULL,
    cpf_cnpj character varying(20) NOT NULL,
    data_cadastro date NOT NULL,
    tipo_cliente character varying(50) NOT NULL
);
    DROP TABLE public."Clientes";
       public         heap    postgres    false            �            1259    24597    Entrada    TABLE       CREATE TABLE public."Entrada" (
    id_entrada integer NOT NULL,
    id_cliente integer NOT NULL,
    data_entrada date NOT NULL,
    valor_entrada double precision NOT NULL,
    metodo_pagamento character varying(15) NOT NULL,
    obs character varying(30) NOT NULL
);
    DROP TABLE public."Entrada";
       public         heap    postgres    false            �            1259    24582    Funcionarios    TABLE     �  CREATE TABLE public."Funcionarios" (
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
 "   DROP TABLE public."Funcionarios";
       public         heap    postgres    false            �            1259    24587    Maquina    TABLE       CREATE TABLE public."Maquina" (
    "id_maquina " integer NOT NULL,
    id_cliente integer NOT NULL,
    tipo character varying(30) NOT NULL,
    status character varying(30) NOT NULL,
    hora_inicio time with time zone NOT NULL,
    hora_fim time with time zone NOT NULL
);
    DROP TABLE public."Maquina";
       public         heap    postgres    false            �            1259    24607    Movimento_Financeiro    TABLE     �   CREATE TABLE public."Movimento_Financeiro" (
    id_movto integer NOT NULL,
    descricao_movto character varying(5) NOT NULL,
    data_movto date NOT NULL,
    hora_movto time with time zone NOT NULL
);
 *   DROP TABLE public."Movimento_Financeiro";
       public         heap    postgres    false            �            1259    24612    Reserva    TABLE     �   CREATE TABLE public."Reserva" (
    id_reserva integer NOT NULL,
    id_cliente integer NOT NULL,
    id_maquina integer NOT NULL,
    data_reserva date NOT NULL
);
    DROP TABLE public."Reserva";
       public         heap    postgres    false            �            1259    24602    Saida    TABLE     �   CREATE TABLE public."Saida" (
    id_saida integer NOT NULL,
    data_saida date NOT NULL,
    valor_saida double precision NOT NULL,
    obs character varying(30) NOT NULL
);
    DROP TABLE public."Saida";
       public         heap    postgres    false            �            1259    24592    Servico    TABLE     �   CREATE TABLE public."Servico" (
    id_servico integer NOT NULL,
    tipo_servico character varying(30) NOT NULL,
    descricao character varying(30),
    produtos character varying(30),
    valor double precision
);
    DROP TABLE public."Servico";
       public         heap    postgres    false            �            1259    24617    historico_Uso    TABLE     �   CREATE TABLE public."historico_Uso" (
    id_historico integer NOT NULL,
    id_cliente integer NOT NULL,
    id_maquina integer NOT NULL,
    id_reserva integer NOT NULL
);
 #   DROP TABLE public."historico_Uso";
       public         heap    postgres    false            �          0    24622 	   Avaliacao 
   TABLE DATA           m   COPY public."Avaliacao" (id_avaliacao, id_cliente, id_servico, nota, comentario, data_avaliacao) FROM stdin;
    public          postgres    false    224   :8       �          0    24577    Clientes 
   TABLE DATA           �   COPY public."Clientes" (id_cliente, nome_cliente, email, telefone, endereco, cpf_cnpj, data_cadastro, tipo_cliente) FROM stdin;
    public          postgres    false    215   W8       �          0    24597    Entrada 
   TABLE DATA           o   COPY public."Entrada" (id_entrada, id_cliente, data_entrada, valor_entrada, metodo_pagamento, obs) FROM stdin;
    public          postgres    false    219   t8       �          0    24582    Funcionarios 
   TABLE DATA           �   COPY public."Funcionarios" (id_funcionario, nome_funcionario, cargo, email, telefone, data_contratacao, prazo_contrato, genero, cpf, endereco) FROM stdin;
    public          postgres    false    216   �8       �          0    24587    Maquina 
   TABLE DATA           c   COPY public."Maquina" ("id_maquina ", id_cliente, tipo, status, hora_inicio, hora_fim) FROM stdin;
    public          postgres    false    217   �8       �          0    24607    Movimento_Financeiro 
   TABLE DATA           c   COPY public."Movimento_Financeiro" (id_movto, descricao_movto, data_movto, hora_movto) FROM stdin;
    public          postgres    false    221   �8       �          0    24612    Reserva 
   TABLE DATA           U   COPY public."Reserva" (id_reserva, id_cliente, id_maquina, data_reserva) FROM stdin;
    public          postgres    false    222   �8       �          0    24602    Saida 
   TABLE DATA           I   COPY public."Saida" (id_saida, data_saida, valor_saida, obs) FROM stdin;
    public          postgres    false    220   9       �          0    24592    Servico 
   TABLE DATA           Y   COPY public."Servico" (id_servico, tipo_servico, descricao, produtos, valor) FROM stdin;
    public          postgres    false    218   "9       �          0    24617    historico_Uso 
   TABLE DATA           [   COPY public."historico_Uso" (id_historico, id_cliente, id_maquina, id_reserva) FROM stdin;
    public          postgres    false    223   ?9       P           2606    24628    Avaliacao Avaliacao_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Avaliacao"
    ADD CONSTRAINT "Avaliacao_pkey" PRIMARY KEY (id_avaliacao);
 F   ALTER TABLE ONLY public."Avaliacao" DROP CONSTRAINT "Avaliacao_pkey";
       public            postgres    false    224            >           2606    24581    Clientes Clientes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Clientes"
    ADD CONSTRAINT "Clientes_pkey" PRIMARY KEY (id_cliente);
 D   ALTER TABLE ONLY public."Clientes" DROP CONSTRAINT "Clientes_pkey";
       public            postgres    false    215            F           2606    24601    Entrada Entrada_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Entrada"
    ADD CONSTRAINT "Entrada_pkey" PRIMARY KEY (id_entrada);
 B   ALTER TABLE ONLY public."Entrada" DROP CONSTRAINT "Entrada_pkey";
       public            postgres    false    219            @           2606    24586    Funcionarios Funcionarios_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Funcionarios"
    ADD CONSTRAINT "Funcionarios_pkey" PRIMARY KEY (id_funcionario);
 L   ALTER TABLE ONLY public."Funcionarios" DROP CONSTRAINT "Funcionarios_pkey";
       public            postgres    false    216            B           2606    24591    Maquina Maquina_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Maquina"
    ADD CONSTRAINT "Maquina_pkey" PRIMARY KEY ("id_maquina ");
 B   ALTER TABLE ONLY public."Maquina" DROP CONSTRAINT "Maquina_pkey";
       public            postgres    false    217            J           2606    24611 .   Movimento_Financeiro Movimento_Financeiro_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Movimento_Financeiro"
    ADD CONSTRAINT "Movimento_Financeiro_pkey" PRIMARY KEY (id_movto, descricao_movto);
 \   ALTER TABLE ONLY public."Movimento_Financeiro" DROP CONSTRAINT "Movimento_Financeiro_pkey";
       public            postgres    false    221    221            L           2606    24616    Reserva Reserva_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Reserva"
    ADD CONSTRAINT "Reserva_pkey" PRIMARY KEY (id_reserva);
 B   ALTER TABLE ONLY public."Reserva" DROP CONSTRAINT "Reserva_pkey";
       public            postgres    false    222            H           2606    24606    Saida Saida_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Saida"
    ADD CONSTRAINT "Saida_pkey" PRIMARY KEY (id_saida);
 >   ALTER TABLE ONLY public."Saida" DROP CONSTRAINT "Saida_pkey";
       public            postgres    false    220            D           2606    24596    Servico Servico_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Servico"
    ADD CONSTRAINT "Servico_pkey" PRIMARY KEY (id_servico);
 B   ALTER TABLE ONLY public."Servico" DROP CONSTRAINT "Servico_pkey";
       public            postgres    false    218            N           2606    24621     historico_Uso historico_Uso_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."historico_Uso"
    ADD CONSTRAINT "historico_Uso_pkey" PRIMARY KEY (id_historico);
 N   ALTER TABLE ONLY public."historico_Uso" DROP CONSTRAINT "historico_Uso_pkey";
       public            postgres    false    223            Q           2606    24641    Maquina id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Maquina"
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public."Clientes"(id_cliente) NOT VALID;
 A   ALTER TABLE ONLY public."Maquina" DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    215    4670    217            R           2606    24646    Entrada id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Entrada"
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public."Clientes"(id_cliente) NOT VALID;
 A   ALTER TABLE ONLY public."Entrada" DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    4670    215    219            S           2606    24651    Reserva id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reserva"
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public."Clientes"(id_cliente) NOT VALID;
 A   ALTER TABLE ONLY public."Reserva" DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    215    4670    222            U           2606    24661    historico_Uso id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."historico_Uso"
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public."Clientes"(id_cliente) NOT VALID;
 G   ALTER TABLE ONLY public."historico_Uso" DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    4670    223    215            X           2606    24676    Avaliacao id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Avaliacao"
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public."Clientes"(id_cliente) NOT VALID;
 C   ALTER TABLE ONLY public."Avaliacao" DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    215    224    4670            T           2606    24656    Reserva id_maquina_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reserva"
    ADD CONSTRAINT id_maquina_fk FOREIGN KEY (id_maquina) REFERENCES public."Maquina"("id_maquina ") NOT VALID;
 A   ALTER TABLE ONLY public."Reserva" DROP CONSTRAINT id_maquina_fk;
       public          postgres    false    222    217    4674            V           2606    24666    historico_Uso id_maquina_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."historico_Uso"
    ADD CONSTRAINT id_maquina_fk FOREIGN KEY (id_maquina) REFERENCES public."Maquina"("id_maquina ") NOT VALID;
 G   ALTER TABLE ONLY public."historico_Uso" DROP CONSTRAINT id_maquina_fk;
       public          postgres    false    4674    223    217            W           2606    24671    historico_Uso id_reserva_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."historico_Uso"
    ADD CONSTRAINT id_reserva_fk FOREIGN KEY (id_reserva) REFERENCES public."Reserva"(id_reserva) NOT VALID;
 G   ALTER TABLE ONLY public."historico_Uso" DROP CONSTRAINT id_reserva_fk;
       public          postgres    false    222    4684    223            Y           2606    24681    Avaliacao id_servico_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Avaliacao"
    ADD CONSTRAINT id_servico_fk FOREIGN KEY (id_servico) REFERENCES public."Servico"(id_servico) NOT VALID;
 C   ALTER TABLE ONLY public."Avaliacao" DROP CONSTRAINT id_servico_fk;
       public          postgres    false    218    4676    224            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     