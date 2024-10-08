PGDMP                      |            CRM-DB    16.3    16.3 C    :           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ;           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            <           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            =           1262    24577    CRM-DB    DATABASE        CREATE DATABASE "CRM-DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "CRM-DB";
                postgres    false                        3079    24762    pg_trgm 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;
    DROP EXTENSION pg_trgm;
                   false            >           0    0    EXTENSION pg_trgm    COMMENT     e   COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';
                        false    2            �            1255    24673 �   inserircliente(integer, character varying, character varying, character varying, character varying, character varying, date, character varying)    FUNCTION     �  CREATE FUNCTION public.inserircliente(codigo integer, nome_cliente character varying, email character varying, telefone character varying, endereco character varying, cpf_cnpj character varying, data_cadastro date, tipo_cliente character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	insert into clientes(id_cliente,nome_cliente,email,telefone,endereco,cpf_cnpj,data_cadastro,tipo_cliente)
	values (codigo,nome_cliente,email,telefone,endereco,cpf_cnpj,data_cadastro,tipo_cliente); 
END;
$$;
 �   DROP FUNCTION public.inserircliente(codigo integer, nome_cliente character varying, email character varying, telefone character varying, endereco character varying, cpf_cnpj character varying, data_cadastro date, tipo_cliente character varying);
       public          postgres    false            �            1255    24678 ^   inserirentrada(integer, integer, date, double precision, character varying, character varying)    FUNCTION     (  CREATE FUNCTION public.inserirentrada(codigo integer, id_cliente integer, data_entrada date, valor_entrada double precision, metodo_pagamento character varying, obs character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	insert into entrada(id_entrada,id_cliente,data_entrada,valor_entrada,metodo_pagamento,obs)
	values (codigo,id_cliente,data_entrada,valor_entrada,metodo_pagamento,obs); 
	insert into movimento_financeiro(tabela_banco,acao,data,hora,usuario)
	values ('Entrada','Inserir entrada:',now(),now(),'Funcionário'); 
END;
$$;
 �   DROP FUNCTION public.inserirentrada(codigo integer, id_cliente integer, data_entrada date, valor_entrada double precision, metodo_pagamento character varying, obs character varying);
       public          postgres    false            �            1255    24679 @   inserirsaida(integer, date, double precision, character varying)    FUNCTION     �  CREATE FUNCTION public.inserirsaida(codigo integer, data_saida date, valor_saida double precision, obs character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	insert into saida(id_saida,data_saida,valor_saida,obs)
	values (codigo,data_saida,valor_saida,obs); 
	insert into movimento_financeiro(tabela_banco,acao,data,hora,usuario)
	values ('Saída','Inserir Saída:',now(),now(),'Funcionário'); 
END;
$$;
 y   DROP FUNCTION public.inserirsaida(codigo integer, data_saida date, valor_saida double precision, obs character varying);
       public          postgres    false            �            1259    24578 	   avaliacao    TABLE     �   CREATE TABLE public.avaliacao (
    id_avaliacao integer NOT NULL,
    id_cliente integer NOT NULL,
    id_servico integer NOT NULL,
    nota numeric(10,0) NOT NULL,
    comentario character varying NOT NULL,
    data_avaliacao date NOT NULL
);
    DROP TABLE public.avaliacao;
       public         heap    postgres    false            ?           0    0    TABLE avaliacao    ACL     �   GRANT SELECT ON TABLE public.avaliacao TO estagiario;
GRANT SELECT,INSERT,UPDATE ON TABLE public.avaliacao TO funcionario;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.avaliacao TO gerente;
          public          postgres    false    216            �            1259    24583    clientes    TABLE     v  CREATE TABLE public.clientes (
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
       public         heap    postgres    false            @           0    0    TABLE clientes    ACL     �   GRANT SELECT ON TABLE public.clientes TO estagiario;
GRANT SELECT,INSERT,UPDATE ON TABLE public.clientes TO funcionario;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.clientes TO gerente;
          public          postgres    false    217            �            1259    24586    entrada    TABLE       CREATE TABLE public.entrada (
    id_entrada integer NOT NULL,
    id_cliente integer NOT NULL,
    data_entrada date NOT NULL,
    valor_entrada double precision NOT NULL,
    metodo_pagamento character varying(15) NOT NULL,
    obs character varying(30) NOT NULL
);
    DROP TABLE public.entrada;
       public         heap    postgres    false            A           0    0    TABLE entrada    ACL     �   GRANT SELECT,INSERT,UPDATE ON TABLE public.entrada TO funcionario;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.entrada TO gerente;
          public          postgres    false    218            �            1259    24589    funcionarios    TABLE     �  CREATE TABLE public.funcionarios (
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
       public         heap    postgres    false            B           0    0    TABLE funcionarios    ACL     K   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.funcionarios TO gerente;
          public          postgres    false    219            �            1259    24592    historico_uso    TABLE     �   CREATE TABLE public.historico_uso (
    id_historico integer NOT NULL,
    id_cliente integer NOT NULL,
    id_maquina integer NOT NULL,
    id_reserva integer NOT NULL
);
 !   DROP TABLE public.historico_uso;
       public         heap    postgres    false            C           0    0    TABLE historico_uso    ACL     �   GRANT SELECT ON TABLE public.historico_uso TO estagiario;
GRANT SELECT,INSERT,UPDATE ON TABLE public.historico_uso TO funcionario;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.historico_uso TO gerente;
          public          postgres    false    220            �            1259    24595    maquina    TABLE       CREATE TABLE public.maquina (
    "id_maquina " integer NOT NULL,
    id_cliente integer NOT NULL,
    tipo character varying(30) NOT NULL,
    status character varying(30) NOT NULL,
    hora_inicio time with time zone NOT NULL,
    hora_fim time with time zone NOT NULL
);
    DROP TABLE public.maquina;
       public         heap    postgres    false            D           0    0    TABLE maquina    ACL     �   GRANT SELECT ON TABLE public.maquina TO estagiario;
GRANT SELECT,INSERT,UPDATE ON TABLE public.maquina TO funcionario;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.maquina TO gerente;
          public          postgres    false    221            �            1259    24598    movimento_financeiro    TABLE     �   CREATE TABLE public.movimento_financeiro (
    tabela_banco character varying(20) NOT NULL,
    acao character varying(20) NOT NULL,
    data date NOT NULL,
    hora time with time zone NOT NULL,
    usuario character varying(20) NOT NULL
);
 (   DROP TABLE public.movimento_financeiro;
       public         heap    postgres    false            E           0    0    TABLE movimento_financeiro    ACL     S   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.movimento_financeiro TO gerente;
          public          postgres    false    222            �            1259    24601    reserva    TABLE     �   CREATE TABLE public.reserva (
    id_reserva integer NOT NULL,
    id_cliente integer NOT NULL,
    id_maquina integer NOT NULL,
    data_reserva date NOT NULL
);
    DROP TABLE public.reserva;
       public         heap    postgres    false            F           0    0    TABLE reserva    ACL     �   GRANT SELECT ON TABLE public.reserva TO estagiario;
GRANT SELECT,INSERT,UPDATE ON TABLE public.reserva TO funcionario;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.reserva TO gerente;
          public          postgres    false    223            �            1259    24604    saida    TABLE     �   CREATE TABLE public.saida (
    id_saida integer NOT NULL,
    data_saida date NOT NULL,
    valor_saida double precision NOT NULL,
    obs character varying(30) NOT NULL
);
    DROP TABLE public.saida;
       public         heap    postgres    false            G           0    0    TABLE saida    ACL     �   GRANT SELECT,INSERT,UPDATE ON TABLE public.saida TO funcionario;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.saida TO gerente;
          public          postgres    false    224            �            1259    24607    servico    TABLE     �   CREATE TABLE public.servico (
    id_servico integer NOT NULL,
    tipo_servico character varying(30) NOT NULL,
    descricao character varying(30),
    produtos character varying(30),
    valor double precision
);
    DROP TABLE public.servico;
       public         heap    postgres    false            H           0    0    TABLE servico    ACL     �   GRANT SELECT ON TABLE public.servico TO estagiario;
GRANT SELECT,INSERT,UPDATE ON TABLE public.servico TO funcionario;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.servico TO gerente;
          public          postgres    false    225            �            1259    24758    vw_clientecomhistorico    VIEW       CREATE VIEW public.vw_clientecomhistorico AS
 SELECT c.id_cliente,
    c.nome_cliente,
    c.tipo_cliente,
    h.id_historico,
    h.id_maquina,
    h.id_reserva
   FROM (public.clientes c
     LEFT JOIN public.historico_uso h ON ((c.id_cliente = h.id_cliente)));
 )   DROP VIEW public.vw_clientecomhistorico;
       public          postgres    false    217    217    217    220    220    220    220            I           0    0    TABLE vw_clientecomhistorico    ACL     U   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.vw_clientecomhistorico TO gerente;
          public          postgres    false    228            �            1259    24750    vw_clientecomreserva    VIEW     �   CREATE VIEW public.vw_clientecomreserva AS
 SELECT c.id_cliente,
    c.nome_cliente,
    c.email,
    r.id_reserva,
    r.id_maquina,
    r.data_reserva
   FROM (public.clientes c
     LEFT JOIN public.reserva r ON ((c.id_cliente = r.id_cliente)));
 '   DROP VIEW public.vw_clientecomreserva;
       public          postgres    false    223    223    217    217    217    223    223            J           0    0    TABLE vw_clientecomreserva    ACL     S   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.vw_clientecomreserva TO gerente;
          public          postgres    false    226            �            1259    24754    vw_servicocomavaliacao    VIEW       CREATE VIEW public.vw_servicocomavaliacao AS
 SELECT s.id_servico,
    s.tipo_servico,
    s.descricao,
    a.id_avaliacao,
    a.nota,
    a.comentario,
    a.data_avaliacao
   FROM (public.servico s
     LEFT JOIN public.avaliacao a ON ((s.id_servico = a.id_servico)));
 )   DROP VIEW public.vw_servicocomavaliacao;
       public          postgres    false    216    225    216    216    216    216    225    225            K           0    0    TABLE vw_servicocomavaliacao    ACL     U   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.vw_servicocomavaliacao TO gerente;
          public          postgres    false    227            .          0    24578 	   avaliacao 
   TABLE DATA           k   COPY public.avaliacao (id_avaliacao, id_cliente, id_servico, nota, comentario, data_avaliacao) FROM stdin;
    public          postgres    false    216   Q[       /          0    24583    clientes 
   TABLE DATA           ~   COPY public.clientes (id_cliente, nome_cliente, email, telefone, endereco, cpf_cnpj, data_cadastro, tipo_cliente) FROM stdin;
    public          postgres    false    217   �[       0          0    24586    entrada 
   TABLE DATA           m   COPY public.entrada (id_entrada, id_cliente, data_entrada, valor_entrada, metodo_pagamento, obs) FROM stdin;
    public          postgres    false    218   B\       1          0    24589    funcionarios 
   TABLE DATA           �   COPY public.funcionarios (id_funcionario, nome_funcionario, cargo, email, telefone, data_contratacao, prazo_contrato, genero, cpf, endereco) FROM stdin;
    public          postgres    false    219   �\       2          0    24592    historico_uso 
   TABLE DATA           Y   COPY public.historico_uso (id_historico, id_cliente, id_maquina, id_reserva) FROM stdin;
    public          postgres    false    220   	]       3          0    24595    maquina 
   TABLE DATA           a   COPY public.maquina ("id_maquina ", id_cliente, tipo, status, hora_inicio, hora_fim) FROM stdin;
    public          postgres    false    221   .]       4          0    24598    movimento_financeiro 
   TABLE DATA           W   COPY public.movimento_financeiro (tabela_banco, acao, data, hora, usuario) FROM stdin;
    public          postgres    false    222   �]       5          0    24601    reserva 
   TABLE DATA           S   COPY public.reserva (id_reserva, id_cliente, id_maquina, data_reserva) FROM stdin;
    public          postgres    false    223    ^       6          0    24604    saida 
   TABLE DATA           G   COPY public.saida (id_saida, data_saida, valor_saida, obs) FROM stdin;
    public          postgres    false    224   A^       7          0    24607    servico 
   TABLE DATA           W   COPY public.servico (id_servico, tipo_servico, descricao, produtos, valor) FROM stdin;
    public          postgres    false    225   �^       ~           2606    24611    avaliacao avaliacao_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT avaliacao_pkey PRIMARY KEY (id_avaliacao);
 B   ALTER TABLE ONLY public.avaliacao DROP CONSTRAINT avaliacao_pkey;
       public            postgres    false    216            �           2606    24613    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    217            �           2606    24615    entrada entrada_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT entrada_pkey PRIMARY KEY (id_entrada);
 >   ALTER TABLE ONLY public.entrada DROP CONSTRAINT entrada_pkey;
       public            postgres    false    218            �           2606    24617    funcionarios funcionarios_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id_funcionario);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public            postgres    false    219            �           2606    24619     historico_uso historico_Uso_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.historico_uso
    ADD CONSTRAINT "historico_Uso_pkey" PRIMARY KEY (id_historico);
 L   ALTER TABLE ONLY public.historico_uso DROP CONSTRAINT "historico_Uso_pkey";
       public            postgres    false    220            �           2606    24621    maquina maquina_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.maquina
    ADD CONSTRAINT maquina_pkey PRIMARY KEY ("id_maquina ");
 >   ALTER TABLE ONLY public.maquina DROP CONSTRAINT maquina_pkey;
       public            postgres    false    221            �           2606    24623    reserva reserva_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id_reserva);
 >   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_pkey;
       public            postgres    false    223            �           2606    24625    saida saida_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.saida
    ADD CONSTRAINT saida_pkey PRIMARY KEY (id_saida);
 :   ALTER TABLE ONLY public.saida DROP CONSTRAINT saida_pkey;
       public            postgres    false    224            �           2606    24627    servico servico_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY (id_servico);
 >   ALTER TABLE ONLY public.servico DROP CONSTRAINT servico_pkey;
       public            postgres    false    225                       1259    24845    idx_gin_avaliacao    INDEX     _   CREATE INDEX idx_gin_avaliacao ON public.avaliacao USING gin (comentario public.gin_trgm_ops);
 %   DROP INDEX public.idx_gin_avaliacao;
       public            postgres    false    216    2    2    2    2    2    2    2    2    2    2    2    2            �           1259    24844    idx_gin_entrada    INDEX     T   CREATE INDEX idx_gin_entrada ON public.entrada USING gin (obs public.gin_trgm_ops);
 #   DROP INDEX public.idx_gin_entrada;
       public            postgres    false    2    2    2    2    2    2    2    2    2    2    2    2    218            �           1259    24843    idx_gin_saida    INDEX     P   CREATE INDEX idx_gin_saida ON public.saida USING gin (obs public.gin_trgm_ops);
 !   DROP INDEX public.idx_gin_saida;
       public            postgres    false    224    2    2    2    2    2    2    2    2    2    2    2    2            �           1259    24846    idx_servico    INDEX     G   CREATE INDEX idx_servico ON public.servico USING btree (tipo_servico);
    DROP INDEX public.idx_servico;
       public            postgres    false    225            �           2606    24628    maquina id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.maquina
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 ?   ALTER TABLE ONLY public.maquina DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    4737    221    217            �           2606    24633    entrada id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 ?   ALTER TABLE ONLY public.entrada DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    218    217    4737            �           2606    24638    reserva id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 ?   ALTER TABLE ONLY public.reserva DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    4737    217    223            �           2606    24643    historico_uso id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.historico_uso
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 E   ALTER TABLE ONLY public.historico_uso DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    220    4737    217            �           2606    24648    avaliacao id_cliente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 A   ALTER TABLE ONLY public.avaliacao DROP CONSTRAINT id_cliente_fk;
       public          postgres    false    216    4737    217            �           2606    24653    reserva id_maquina_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT id_maquina_fk FOREIGN KEY (id_maquina) REFERENCES public.maquina("id_maquina ") NOT VALID;
 ?   ALTER TABLE ONLY public.reserva DROP CONSTRAINT id_maquina_fk;
       public          postgres    false    221    223    4746            �           2606    24658    historico_uso id_maquina_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.historico_uso
    ADD CONSTRAINT id_maquina_fk FOREIGN KEY (id_maquina) REFERENCES public.maquina("id_maquina ") NOT VALID;
 E   ALTER TABLE ONLY public.historico_uso DROP CONSTRAINT id_maquina_fk;
       public          postgres    false    4746    221    220            �           2606    24663    historico_uso id_reserva_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.historico_uso
    ADD CONSTRAINT id_reserva_fk FOREIGN KEY (id_reserva) REFERENCES public.reserva(id_reserva) NOT VALID;
 E   ALTER TABLE ONLY public.historico_uso DROP CONSTRAINT id_reserva_fk;
       public          postgres    false    223    4748    220            �           2606    24668    avaliacao id_servico_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT id_servico_fk FOREIGN KEY (id_servico) REFERENCES public.servico(id_servico) NOT VALID;
 A   ALTER TABLE ONLY public.avaliacao DROP CONSTRAINT id_servico_fk;
       public          postgres    false    4754    216    225            .   #   x�3�4�4���\N##]s]�=... QN8      /   �   x�]��
�0���S쨇���s�)�D��G/q�v���Q|1�NW��H|$�E���+�n4L��fP���X�j��	q��r%+LH�J*(�9�p�>p�������bR0���"���9�T!42i
����i
8ڧ�>;)����؍�ܻ�����/9!��HY�      0   I   x�3�4�4202�50�52 28�2�K9+��8��҆��h�Ɯ��F iN�Ԕ̒|N�
�=... �6%      1   ^   x�3��M�L���t-.IL�<��(3*䐞�������˩ab��`� �����D��� LC#�7�8�4'3/���3�4)����|�=... P�O      2      x�3�4�4�4����� ��      3   N   x�3�4�NMNL�/J�t�U(-��44�26�20�50�44�����j}� j]2���2�Rs8,�
`��l�=... �y      4   d   x�s�+)JLI���+N-�,RH��8��Lt�t���L++Ss=#3SsKC]cN�Ҽ������2��E2�E7�����P������Ä=... |o(�      5   1   x�3�4�4�4202�50�50�2B0�4A��)�	�
3Y F��� y��      6   2   x�3�4202�50�52 28+������� �Т�Լ��D�=... �
�      7   F   x�3��I,K,R(�/-H���
��ɥE�Ŝ��I��+��*ެ�� ��d�f��s�p��qqq o)�     