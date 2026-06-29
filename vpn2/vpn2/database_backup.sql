--
-- PostgreSQL database dump
--

\restrict Ha6MBbEoDMAnJ6YX7DrTwXcRg7UAc0Xc7eY50b2M3jaPIDYxs1Uvxqh5JDTHibF

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: free_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.free_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: free_keys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.free_keys (
    id integer DEFAULT nextval('public.free_keys_id_seq'::regclass) NOT NULL,
    key text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: premium_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.premium_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: premium_keys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.premium_keys (
    id integer DEFAULT nextval('public.premium_keys_id_seq'::regclass) NOT NULL,
    key text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: referral_counts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.referral_counts (
    user_id text NOT NULL,
    count integer DEFAULT 0 NOT NULL
);


--
-- Name: referrals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.referrals (
    user_id text NOT NULL,
    inviter_id text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.settings (
    key text NOT NULL,
    value text NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscriptions (
    telegram_id text NOT NULL,
    tariff text NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    key text DEFAULT ''::text NOT NULL,
    reminder_sent boolean DEFAULT false NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: support_chats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.support_chats (
    user_id text NOT NULL,
    messages jsonb DEFAULT '[]'::jsonb NOT NULL,
    closed boolean DEFAULT false NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    telegram_id text NOT NULL,
    name text DEFAULT 'Пользователь'::text NOT NULL,
    username text DEFAULT ''::text NOT NULL,
    banned boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    balance integer DEFAULT 0 NOT NULL,
    total_paid integer DEFAULT 0 NOT NULL
);


--
-- Data for Name: free_keys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.free_keys (id, key, created_at) FROM stdin;
31	vless://db399973-bf6c-4c94-bb9c-7d43d8e85f0a@78.159.250.251:25567?flow=xtls-rprx-vision&encryption=none&type=tcp&security=reality&fp=firefox&sni=iv.kommersant.ru&pbk=tsxzBG6xHNl1Nu8XPpd3hWk_zPGrpFrv2Z-difc3nGY&sid=a5bd715847213387#%F0%9F%87%A9%F0%9F%87%AA%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	2026-06-26 16:35:57.309815
\.


--
-- Data for Name: premium_keys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.premium_keys (id, key, created_at) FROM stdin;
5	vless://083471bf-bbf4-4e1d-8953-912b8d3b6255@82.202.177.144:5269?encryption=none&type=tcp&security=reality&fp=firefox&sni=max.ru&pbk=hx1gkWBL2ixtwQSGXEvLT1Yz8GBsCFWriz_WLzLQNHQ&sid=4eb166dbed98e63d#%F0%9F%87%B1%F0%9F%87%BB%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	2026-06-25 19:03:51.22253
\.


--
-- Data for Name: referral_counts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.referral_counts (user_id, count) FROM stdin;
6210878532	3
\.


--
-- Data for Name: referrals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.referrals (user_id, inviter_id, created_at) FROM stdin;
6447461082	6210878532	2026-06-02 16:37:27.776988
1842996007	6210878532	2026-06-02 18:44:11.629872
8246482568	6210878532	2026-06-03 12:38:18.775145
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.settings (key, value, updated_at) FROM stdin;
test_key	vless://07ee6f53-83da-4d46-9e43-3c0c4d8a7e91@185.242.19.250:443?mode=auto&path=%2Fxhttppath&security=tls&encryption=none&fp=chrome&allowinsecure=0&type=xhttp&sni=top3259365054.mwscdn.ru#%F0%9F%87%AC%F0%9F%87%A7%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	2026-06-06 10:32:43.328
payment_requests	{"pay_1782410608595_6210878532":{"telegramId":"6210878532","tariff":"1day","amount":10,"fileId":"AgACAgIAAxkBAAIGsWo9ZlH6kUwWZH4n_Yq5oifCHgL-AAL7GGsbysDxSe-jMaVuBAIwAQADAgADdwADPAQ","createdAt":1782410608596},"pay_1782410702003_6210878532":{"telegramId":"6210878532","tariff":"1day","amount":10,"fileId":"AgACAgIAAxkBAAIGsWo9ZlH6kUwWZH4n_Yq5oifCHgL-AAL7GGsbysDxSe-jMaVuBAIwAQADAgADdwADPAQ","createdAt":1782410702004}}	2026-06-25 18:24:39.992
channel_id	@laenfaer_vpn	2026-05-31 22:39:02.481
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subscriptions (telegram_id, tariff, expires_at, key, reminder_sent, updated_at) FROM stdin;
8556699181	30days	2026-06-30 23:02:55.927	vless://07ee6f53-83da-4d46-9e43-3c0c4d8a7e91@185.242.19.250:443?mode=auto&path=%2Fxhttppath&security=tls&encryption=none&fp=chrome&allowinsecure=0&type=xhttp&sni=top3259365054.mwscdn.ru#%F0%9F%87%AC%F0%9F%87%A7%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	f	2026-06-06 10:32:32.097
8246482568	30days	2026-06-30 23:03:59.634	vless://07ee6f53-83da-4d46-9e43-3c0c4d8a7e91@185.242.19.250:443?mode=auto&path=%2Fxhttppath&security=tls&encryption=none&fp=chrome&allowinsecure=0&type=xhttp&sni=top3259365054.mwscdn.ru#%F0%9F%87%AC%F0%9F%87%A7%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	f	2026-06-06 10:32:32.1
1842996007	30days	2026-07-03 12:46:43.87	vless://07ee6f53-83da-4d46-9e43-3c0c4d8a7e91@185.242.19.250:443?mode=auto&path=%2Fxhttppath&security=tls&encryption=none&fp=chrome&allowinsecure=0&type=xhttp&sni=top3259365054.mwscdn.ru#%F0%9F%87%AC%F0%9F%87%A7%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	f	2026-06-06 10:32:32.107
6447461082	free_7days	2026-07-03 16:36:08.745	vless://db399973-bf6c-4c94-bb9c-7d43d8e85f0a@78.159.250.251:25567?flow=xtls-rprx-vision&encryption=none&type=tcp&security=reality&fp=firefox&sni=iv.kommersant.ru&pbk=tsxzBG6xHNl1Nu8XPpd3hWk_zPGrpFrv2Z-difc3nGY&sid=a5bd715847213387#%F0%9F%87%A9%F0%9F%87%AA%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	f	2026-06-26 16:36:08.746
6210878532	1day	2026-06-26 18:24:39.965	vless://07ee6f53-83da-4d46-9e43-3c0c4d8a7e91@185.242.19.250:443?mode=auto&path=%2Fxhttppath&security=tls&encryption=none&fp=chrome&allowinsecure=0&type=xhttp&sni=top3259365054.mwscdn.ru#%F0%9F%87%AC%F0%9F%87%A7%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	f	2026-06-25 18:24:39.965
8413096188	30days	2026-07-25 19:01:58.707	vless://083471bf-bbf4-4e1d-8953-912b8d3b6255@82.202.177.144:5269?encryption=none&type=tcp&security=reality&fp=firefox&sni=max.ru&pbk=hx1gkWBL2ixtwQSGXEvLT1Yz8GBsCFWriz_WLzLQNHQ&sid=4eb166dbed98e63d#%F0%9F%87%B1%F0%9F%87%BB%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	f	2026-06-25 19:01:58.708
7555570996	free_7days	2026-06-05 00:00:00	vless://083471bf-bbf4-4e1d-8953-912b8d3b6255@82.202.177.144:5269?encryption=none&type=tcp&security=reality&fp=firefox&sni=max.ru&pbk=hx1gkWBL2ixtwQSGXEvLT1Yz8GBsCFWriz_WLzLQNHQ&sid=4eb166dbed98e63d#%F0%9F%87%B1%F0%9F%87%BB%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	t	2026-06-25 19:02:47.388
7285508597	free_7days	2026-06-08 00:00:00	vless://083471bf-bbf4-4e1d-8953-912b8d3b6255@82.202.177.144:5269?encryption=none&type=tcp&security=reality&fp=firefox&sni=max.ru&pbk=hx1gkWBL2ixtwQSGXEvLT1Yz8GBsCFWriz_WLzLQNHQ&sid=4eb166dbed98e63d#%F0%9F%87%B1%F0%9F%87%BB%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	t	2026-06-25 19:02:47.393
8603923638	free_7days	2026-06-10 18:38:16.871	vless://083471bf-bbf4-4e1d-8953-912b8d3b6255@82.202.177.144:5269?encryption=none&type=tcp&security=reality&fp=firefox&sni=max.ru&pbk=hx1gkWBL2ixtwQSGXEvLT1Yz8GBsCFWriz_WLzLQNHQ&sid=4eb166dbed98e63d#%F0%9F%87%B1%F0%9F%87%BB%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	f	2026-06-25 19:02:47.396
5829795314	free_7days	2026-06-10 19:02:05.39	vless://083471bf-bbf4-4e1d-8953-912b8d3b6255@82.202.177.144:5269?encryption=none&type=tcp&security=reality&fp=firefox&sni=max.ru&pbk=hx1gkWBL2ixtwQSGXEvLT1Yz8GBsCFWriz_WLzLQNHQ&sid=4eb166dbed98e63d#%F0%9F%87%B1%F0%9F%87%BB%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	f	2026-06-25 19:02:47.399
370533971	free_7days	2026-06-10 19:13:43.922	vless://083471bf-bbf4-4e1d-8953-912b8d3b6255@82.202.177.144:5269?encryption=none&type=tcp&security=reality&fp=firefox&sni=max.ru&pbk=hx1gkWBL2ixtwQSGXEvLT1Yz8GBsCFWriz_WLzLQNHQ&sid=4eb166dbed98e63d#%F0%9F%87%B1%F0%9F%87%BB%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	f	2026-06-25 19:02:47.403
5218131952	free_3days	2026-06-28 19:03:40.419	vless://083471bf-bbf4-4e1d-8953-912b8d3b6255@82.202.177.144:5269?encryption=none&type=tcp&security=reality&fp=firefox&sni=max.ru&pbk=hx1gkWBL2ixtwQSGXEvLT1Yz8GBsCFWriz_WLzLQNHQ&sid=4eb166dbed98e63d#%F0%9F%87%B1%F0%9F%87%BB%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	f	2026-06-25 19:03:40.419
1311814424	free_3days	2026-06-29 16:16:47.363	vless://083471bf-bbf4-4e1d-8953-912b8d3b6255@82.202.177.144:5269?encryption=none&type=tcp&security=reality&fp=firefox&sni=max.ru&pbk=hx1gkWBL2ixtwQSGXEvLT1Yz8GBsCFWriz_WLzLQNHQ&sid=4eb166dbed98e63d#%F0%9F%87%B1%F0%9F%87%BB%20LTE%20%E2%9A%A1LAENFAER%20FREE%E2%9A%A1	f	2026-06-26 16:16:47.363
\.


--
-- Data for Name: support_chats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.support_chats (user_id, messages, closed, updated_at) FROM stdin;
1842996007	[{"text": "Здарова", "time": 1780426641.965, "fromUser": false}]	f	2026-06-02 18:57:22.103
6210878532	[]	f	2026-06-03 16:25:17.764
7555570996	[{"text": "Не хочу", "time": 1780563462.707, "fromUser": false}, {"text": "Ахахах", "time": 1780563504.004, "fromUser": false}, {"text": "В магазин пиздуй", "time": 1780563523.916, "fromUser": false}, {"text": "Нет", "time": 1780563555.859, "fromUser": false}]	f	2026-06-04 08:59:15.87
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (telegram_id, name, username, banned, created_at, balance, total_paid) FROM stdin;
8540522196	Dan		f	2026-05-31 22:39:02.42416	0	0
1842996007	Егор		f	2026-05-31 22:39:02.428073	0	0
6447461082	Роман		f	2026-05-31 22:39:02.431645	0	0
8556699181	Хеда		f	2026-05-31 22:39:02.435195	0	0
7285508597	DI | Темний принц		f	2026-05-31 22:39:02.439277	0	0
8246482568	Пользователь		f	2026-05-31 22:39:02.442702	0	0
7555570996	Светлана		f	2026-05-31 22:39:02.419155	0	0
8253976151	Абдурахмон	abudes1gner	f	2026-06-02 16:04:55.486196	0	0
7881261638	♕		f	2026-06-02 16:04:56.956233	0	0
8603923638	ㅤ	z934z	f	2026-06-03 18:38:08.515235	0	0
5829795314	𝒕𝒕:𝒅𝒂𝒓𝒌𝒑𝒓1𝒏𝒄𝒆⚽️👻	darkpr1nce8	f	2026-06-03 19:01:59.017489	0	0
370533971	Николай	Grad555	f	2026-06-03 19:13:34.289238	0	0
6168145684	Юрій	SbbgSiRdag	f	2026-06-03 20:22:41.900721	0	0
8759409575	Ирек		f	2026-06-06 10:14:44.484357	0	0
5793594904	Элиза		f	2026-06-06 10:14:46.924316	0	0
8395760890	Наиль		f	2026-06-06 10:14:47.981733	0	0
8902320457	tt_woly		f	2026-06-06 10:14:48.71746	0	0
6933685624	Jasurbek	Jasurbek_0608	f	2026-06-06 14:20:26.924988	0	0
5818568003	Nozimjon		f	2026-06-06 14:20:27.63475	0	0
8596107718	Vitalik	XVSMLA	f	2026-06-07 20:08:15.605644	0	0
6062390183	$ulugbek$		f	2026-06-22 09:30:22.990039	0	0
7124799902	Ryomen	RyomenGG	f	2026-06-22 09:30:25.044044	0	0
8037872203	qwezon	Floy_444	f	2026-06-22 09:30:25.616925	0	0
1230864174	Ренальгин	renal_amanov08	f	2026-06-22 09:30:29.28717	0	0
6715748047	Чайный	Kasper_Escobar	f	2026-06-22 09:30:29.810909	0	0
979736529	Толя	play_gems05	f	2026-06-22 09:30:30.631171	0	0
1777984659	𝖁𝖆𝖉𝖎𝖒🦁	Vadimxohlov7	f	2026-06-22 10:04:25.14534	0	0
6586265165	Holter	Holteri	f	2026-06-25 15:20:41.643088	0	0
5459535178	🐣	difflii	f	2026-06-25 15:20:43.671292	0	0
7810076654	⚜️	qw_onda	f	2026-06-25 15:20:45.295539	0	0
7927703098	Lew Empire	RONALDO_ADIL	f	2026-06-25 15:20:46.556414	0	0
6272706295	.		f	2026-06-25 15:20:47.62387	0	0
8593501971	01	Dsw_01_ss	f	2026-06-25 15:20:48.501915	0	0
8261990751	Давид		f	2026-06-25 15:20:54.596005	0	0
7263486636	S1mpl🆘	S1mpl_prime_2018	f	2026-06-25 15:20:55.943627	0	0
1307308185	Кирилл	crewyk	f	2026-06-25 15:20:57.297494	0	0
5756994294	Kamary	KomnatkaN1	f	2026-06-25 15:20:58.220505	0	0
8413096188	Грузосервис		f	2026-05-31 22:39:02.415544	1270	1270
6210878532	Руслан	laenfaer_official	f	2026-06-25 17:56:26.328142	20	20
5996824051	v𝚊𝚗𝚢𝚊	Vannnyya	f	2026-06-25 18:25:00.202915	0	0
5218131952	_n.o.r._777	norr_102	f	2026-06-25 19:02:59.377459	0	0
5448980850	илюшик	XwX_1488	f	2026-06-25 19:08:45.862644	0	0
8311436650	Мади		f	2026-06-25 19:15:02.056688	0	0
8400448446	𝕽𝖎𝖈𝖍_𝕮𝖗𝖔𝖜𝖓	richcrown0	f	2026-06-26 11:42:57.746967	0	0
6716937727	Амин	Strax_xyev	f	2026-06-26 11:42:58.245829	0	0
8434142475	Yura	lankov24	f	2026-06-26 13:56:12.764987	0	0
6645084492	kk	dadimponovoy	f	2026-06-26 16:15:24.812166	0	0
1311814424	ɴᴀᴅʏᴜsʏᴀ	YungNadhawwaii	f	2026-06-26 16:16:33.401029	0	0
\.


--
-- Name: free_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.free_keys_id_seq', 31, true);


--
-- Name: premium_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.premium_keys_id_seq', 5, true);


--
-- Name: free_keys free_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.free_keys
    ADD CONSTRAINT free_keys_pkey PRIMARY KEY (id);


--
-- Name: premium_keys premium_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.premium_keys
    ADD CONSTRAINT premium_keys_pkey PRIMARY KEY (id);


--
-- Name: referral_counts referral_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referral_counts
    ADD CONSTRAINT referral_counts_pkey PRIMARY KEY (user_id);


--
-- Name: referrals referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (user_id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (key);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (telegram_id);


--
-- Name: support_chats support_chats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.support_chats
    ADD CONSTRAINT support_chats_pkey PRIMARY KEY (user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (telegram_id);


--
-- PostgreSQL database dump complete
--

\unrestrict Ha6MBbEoDMAnJ6YX7DrTwXcRg7UAc0Xc7eY50b2M3jaPIDYxs1Uvxqh5JDTHibF

