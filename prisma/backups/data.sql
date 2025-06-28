SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method", "auth_code_issued_at") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."instances" ("id", "uuid", "raw_base_config", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_factors" ("id", "user_id", "friendly_name", "factor_type", "status", "created_at", "updated_at", "secret", "phone", "last_challenged_at", "web_authn_credential", "web_authn_aaguid") FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_challenges" ("id", "factor_id", "created_at", "verified_at", "ip_address", "otp_code", "web_authn_session_data") FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."one_time_tokens" ("id", "user_id", "token_type", "token_hash", "relates_to", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_providers" ("id", "resource_id", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_providers" ("id", "sso_provider_id", "entity_id", "metadata_xml", "metadata_url", "attribute_mapping", "created_at", "updated_at", "name_id_format") FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_relay_states" ("id", "sso_provider_id", "request_id", "for_email", "redirect_to", "created_at", "updated_at", "flow_state_id") FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_domains" ("id", "sso_provider_id", "domain", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."_prisma_migrations" ("id", "checksum", "finished_at", "migration_name", "logs", "rolled_back_at", "started_at", "applied_steps_count") FROM stdin;
b4bb731e-101d-4394-85d8-8c6623b94743	e07a8a03f0ae36f1706219e961141d35b5fbee7e6f9c0c6c8f8a0e2174f38e96	2025-06-27 22:07:36.590063+00	20250627220735_initial_migration	\N	\N	2025-06-27 22:07:36.247896+00	1
71a98e5d-5697-4821-b303-5008d572670d	821b16d7ddd407dbf19a2b91f26395799cafb3789b5f39d6907937f1a4a28382	2025-06-27 22:43:17.657831+00	20250627224317_fk_sessionid_to_session_id	\N	\N	2025-06-27 22:43:17.375589+00	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."users" ("id", "email", "emailVerified", "password", "firstName", "lastName", "profilePicture", "timezone", "currency", "createdAt", "updatedAt", "lastLoginAt", "isActive") FROM stdin;
1	anonymous+1@example.com	f	\N	\N	\N	\N	UTC	USD	2025-06-27 22:38:02.339	2025-06-27 22:38:02.339	\N	f
\.


--
-- Data for Name: ai_extraction_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."ai_extraction_logs" ("id", "userId", "rawInput", "extractedData", "aiResponse", "extractionType", "aiModel", "aiProvider", "confidenceScore", "processingTimeMs", "wasSuccessful", "needsFollowUp", "userConfirmed", "correctionsMade", "sessionId", "ipAddress", "userAgent", "createdAt") FROM stdin;
\.


--
-- Data for Name: analytics_cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."analytics_cache" ("id", "userId", "cacheKey", "analyticsType", "data", "parameters", "isValid", "hitCount", "createdAt", "expiresAt", "lastAccessedAt") FROM stdin;
\.


--
-- Data for Name: budgets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."budgets" ("id", "userId", "name", "category", "budgetAmount", "spentAmount", "period", "startDate", "endDate", "isActive", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: chat_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."chat_sessions" ("id", "userId", "sessionId", "title", "context", "isActive", "totalMessages", "totalExpenses", "totalIncome", "totalSavings", "createdAt", "updatedAt", "lastMessageAt") FROM stdin;
79c37ff5-a7fc-4afc-af49-6f1ebd7c7ce7	1	final-test	AI Conversation	AI Conversation	t	0	0	0	0	2025-06-28 08:11:02.192	2025-06-28 08:11:07.807	2025-06-28 08:11:02.192
3f093e61-75d5-4764-b50d-8f40c8234dd0	1	test-session-1	AI Conversation	AI Conversation	t	0	0	0	0	2025-06-27 22:38:02.816	2025-06-28 08:51:15.342	2025-06-27 22:38:02.816
a4683cbd-a98a-482b-9912-388706f75dc1	1	test-fix-session	AI Conversation	AI Conversation	t	0	0	0	0	2025-06-28 08:19:51.067	2025-06-28 08:19:59.199	2025-06-28 08:19:51.067
7190276b-c5f4-41e8-b4ad-80933466066f	1	test-session-2	AI Conversation	AI Conversation	t	0	0	0	0	2025-06-28 08:06:31.368	2025-06-28 08:06:37.297	2025-06-28 08:06:31.368
fab1cc89-8b4f-4cc0-9c3f-c42e841c815b	1	test-session-3	AI Conversation	AI Conversation	t	0	0	0	0	2025-06-28 08:07:18.231	2025-06-28 08:07:24.662	2025-06-28 08:07:18.231
39133e5e-586f-4c04-91ad-7abf14cb0d28	1	test-session-4	AI Conversation	AI Conversation	t	0	0	0	0	2025-06-28 08:09:18.356	2025-06-28 08:09:24.978	2025-06-28 08:09:18.356
6b2ade0a-0fce-4e73-bb84-02db8578f506	1	test-session-5	AI Conversation	AI Conversation	t	0	0	0	0	2025-06-28 08:10:01.256	2025-06-28 08:10:07.632	2025-06-28 08:10:01.256
d5eeb38c-16a8-4938-8cae-df700e763e06	1	test-session-6	AI Conversation	AI Conversation	t	0	0	0	0	2025-06-28 08:10:21.805	2025-06-28 08:10:28.298	2025-06-28 08:10:21.805
504e8d6d-255a-4b44-8d65-d94f479da20b	1	test-session-7	AI Conversation	AI Conversation	t	0	0	0	0	2025-06-28 08:10:32.168	2025-06-28 08:10:40.112	2025-06-28 08:10:32.168
\.


--
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."chat_messages" ("id", "sessionId", "role", "content", "messageType", "intent", "confidence", "processingTimeMs", "aiModel", "tokenCount", "createdAt") FROM stdin;
e791f582-1f5f-497f-97c8-eca131d025ae	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	spent 50 dollar on mobile reacharge	TEXT	\N	\N	\N	\N	\N	2025-06-27 22:38:07.726
8eb84062-ab00-464e-808c-bdcd385bcfc9	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	Got it! I've recorded your $50.00 expense for mobile recharge.	TEXT	\N	\N	\N	\N	\N	2025-06-27 22:38:08.991
96fe6ca2-0acf-4b74-9a95-9d8e249e412d	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	i also bought 200 dollar shoes  yesterday	TEXT	\N	\N	\N	\N	\N	2025-06-27 22:44:09.214
7c9be9cf-35ff-4576-9812-5f571ca4209e	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	Okay, I've added your $200.00 expense for shoes from yesterday.	TEXT	\N	\N	\N	\N	\N	2025-06-27 22:44:10.609
42f6f276-1dc8-4236-9b20-88490363bfbc	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	no i mean i have 1000 dollar savings with me	TEXT	\N	\N	\N	\N	\N	2025-06-27 22:46:33.201
6062ac65-e3e1-4417-b84b-ec29b71503d0	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?	TEXT	\N	\N	\N	\N	\N	2025-06-27 22:46:34.618
3b6ed83f-f8d0-42e1-acfb-bef3d59b86cd	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	can you tell me what i asked you last time?	TEXT	\N	\N	\N	\N	\N	2025-06-27 22:50:07.182
8ee1d762-8a1a-4671-a0fb-c2ba334cf355	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.	TEXT	\N	\N	\N	\N	\N	2025-06-27 22:50:07.763
6789da41-f531-44bf-a759-b04c1bc333a4	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	i spent 40 dollar on snacks now	TEXT	\N	\N	\N	\N	\N	2025-06-27 22:54:04.562
7096c8ac-b6a1-4b34-8e74-2653e13c972c	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	Great! I've recorded your $40.00 expense for snacks.	TEXT	\N	\N	\N	\N	\N	2025-06-27 22:54:05.985
2529468b-0551-488f-ad66-d20bbc161601	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT		TEXT	\N	\N	\N	\N	\N	2025-06-27 23:01:37.544
0fb0fe91-eba0-4de8-ac15-3f9ed6df5ecb	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT		TEXT	\N	\N	\N	\N	\N	2025-06-27 23:06:25.201
7ff2c2a2-2f5a-4430-a154-614ae29c62e8	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT		TEXT	\N	\N	\N	\N	\N	2025-06-27 23:08:01.873
18313639-4846-4adb-b361-6c93850fceaf	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT		TEXT	\N	\N	\N	\N	\N	2025-06-27 23:09:38.088
0d7f08da-1647-4edc-9b12-0a70c8c5784b	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT		TEXT	\N	\N	\N	\N	\N	2025-06-27 23:10:21.091
c89b199d-b8ac-47cb-8890-497cad081b15	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	i got 700 usd from my mom 	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:00:46.997
eb914873-d33a-48ba-8289-26bb52dea540	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:00:47.555
50d51bf4-c0b9-4ab4-8d9e-22aa66e4b6f9	7190276b-c5f4-41e8-b4ad-80933466066f	USER	i got 700 usd from my mom	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:06:37.851
338807f2-1b17-4374-88f2-b74beef91753	7190276b-c5f4-41e8-b4ad-80933466066f	ASSISTANT	Awesome! Just let me know when you have an expense to track. 😊	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:06:38.408
a249d5bd-6e79-4852-9662-b95a5088bc88	fab1cc89-8b4f-4cc0-9c3f-c42e841c815b	USER	i got 700 usd from my mom	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:07:23.832
d5225457-ae8b-4d77-9324-31bb1f334d76	fab1cc89-8b4f-4cc0-9c3f-c42e841c815b	ASSISTANT	I've recorded your $700.00 income from your mom.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:07:25.262
e73541df-9c01-43d2-82f8-84afaf617bc1	39133e5e-586f-4c04-91ad-7abf14cb0d28	USER	i got 700 usd from my mom	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:09:24.146
0cf389f9-02a5-46c7-8666-134ebd04ed42	39133e5e-586f-4c04-91ad-7abf14cb0d28	ASSISTANT	I've recorded your $700.00 income from your mom.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:09:25.564
675fb39e-dc54-4e4c-a2c4-0bad265b6834	6b2ade0a-0fce-4e73-bb84-02db8578f506	USER	i got 700 usd from my mom	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:10:06.888
b6c677f1-f086-4182-9565-a139aa707377	6b2ade0a-0fce-4e73-bb84-02db8578f506	ASSISTANT	I've recorded your $700.00 income from your mom.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:10:08.224
8eedd871-293d-40e7-8ef9-3b136fcc28b9	d5eeb38c-16a8-4938-8cae-df700e763e06	USER	I spent 25 dollars on lunch at McDonald's	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:10:27.298
5543a7df-66ba-4ddf-838f-25c78063dcbf	d5eeb38c-16a8-4938-8cae-df700e763e06	ASSISTANT	I've recorded your $25.00 expense for lunch at McDonald's.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:10:28.827
260156b3-7567-446b-830a-7fb0d2d4e695	504e8d6d-255a-4b44-8d65-d94f479da20b	USER	I put 500 into my emergency fund	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:10:39.378
725acd41-bdd1-41bc-903d-be812dc6aff9	504e8d6d-255a-4b44-8d65-d94f479da20b	ASSISTANT	I've recorded your $500.00 savings for your emergency fund.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:10:40.64
f7b13336-5588-4f31-adc4-ea29d5d11708	79c37ff5-a7fc-4afc-af49-6f1ebd7c7ce7	USER	i earned 2000 from freelance work	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:11:07.091
e3dd11b4-d212-4a7d-98f2-e1cc055fc508	79c37ff5-a7fc-4afc-af49-6f1ebd7c7ce7	ASSISTANT	I've recorded your $2000.00 income from freelance work.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:11:08.327
a423d1ac-fee9-4997-b2cf-85824f0679a5	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	my salary came for this month 4000 usd	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:13:13.77
475e25f0-66fc-4121-880d-f6a09189f4f6	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	I've recorded your $4000.00 income from your monthly salary.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:13:15.018
e05231c2-a17f-46f9-8f03-57066a163caf	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	i will add this item in my expenses	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:16:35.083
f7b1e168-7ce2-4595-b28f-20b61ae3bc0a	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	I'd be happy to help! How much did you spend and what was it for?	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:16:36.783
de2f518b-38f8-4fab-abe4-4df8e34bbb01	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:17:30.801
c6631558-f34b-49a7-be0e-d017f3f9c394	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:17:32.85
7f256cc0-9792-4621-9cf2-50c4e47017f3	a4683cbd-a98a-482b-9912-388706f75dc1	USER	spent 2000 dollars and i want you to put it under the grocery category	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:19:58.388
25a6d68e-4d4e-4703-9044-907b726071fd	a4683cbd-a98a-482b-9912-388706f75dc1	ASSISTANT	I've recorded your $2000.00 expense for groceries.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:19:59.744
539fba38-52bd-40b1-8963-35d62f9d8425	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	spent 1000 dollars and i want you to put it under the grocery category	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:22:01.807
e6c3882c-e82f-42b3-9a22-eb4f27fe21bf	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	I've recorded your $1000.00 expense for groceries.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:22:03.292
a6fdaeb8-60e3-40bc-87f4-30390d2e02b1	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	my grany gave me 1500 dollar today	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:24:57.583
5cfa78a8-94e1-4f05-93a4-82060eeefa65	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	I've recorded your $1500.00 income from your grandmother.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:24:59.109
a005f355-f7e9-4a81-87a6-8a3a17b2b57d	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	i spent	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:26:00.259
c71bf68c-f446-4d59-b883-21964dafbc54	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	I'd be happy to help! How much did you spend and what was it for?	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:26:01.789
8e6f8f82-7c14-4ffd-8e4f-110b5947886d	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	i spent	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:26:08.254
1d9a5b53-e09a-49ef-9d37-6d8b74069ec5	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	Okay, I can record that for you! How much did you spend and what was it for?	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:26:09.092
4439b916-585a-4736-9cc6-9d6b8651b4e7	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	it was 44 dollars and for the zoo fees	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:26:45.019
ed4356d4-d21f-4044-b458-249a73819ab9	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	I've recorded your $44.00 expense for zoo fees.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:26:46.534
a2a5f01f-727f-4387-b97f-d8d223f1a7eb	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	how can i know my expenses for today and also the savings and income?	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:27:22.987
98bdaa12-eef1-4645-935e-ea8422e09cdd	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	I can help you record your transactions, but I don't have the ability to track or summarize your past expenses, income, or savings. My function is to process and categorize new transactions as you provide them.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:27:24.515
8d428261-a187-488e-ad53-3c28dc27b9b3	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	how can i know my expenses for today and also the savings and income?	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:27:34.992
c0f39f10-d68a-4e82-b5b6-89aec27fc4f1	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	I can help you record your expenses as you tell them to me, but I don't have a feature to show you summaries of your spending, income, or savings. My main job is to help you log new transactions!	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:27:35.768
3abdeb76-4e80-460a-9d16-fbcc23d36a7c	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	how can i know my expenses for today and also the savings and income?	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:31:10.807
8449952b-f27c-4063-a898-b77413512c20	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	I can help you record your transactions as you tell them to me, but I don't have a feature that allows me to track or summarize your past expenses, income, or savings for you. My purpose is to help you log new transactions one by one.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:31:12.407
c453840d-3afe-4ea3-af90-b30afea837c5	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	Based on this analytics data: Today you've spent $3069.00, saved $500.00, and earned $8200.00. and our conversation history, provide a personalized response.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:31:25.693
8bea3534-c00f-428f-9d96-153efee1c723	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	Thanks for sharing that! It looks like today you've spent $3069.00. I recall you've logged expenses like mobile recharge and shoes in the past. It's great to see you've also saved $500.00 and earned $8200.00! Keep up the excellent tracking!	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:31:27.337
007daeb6-27c3-4d56-b704-444753668d2f	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	how can i know my expenses for today and also the savings and income?	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:51:01.709
82e31bfc-381a-4272-9928-1ae6cfd45a7c	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	I can help you record your transactions as you tell them to me, but I don't have a feature that allows me to track or summarize your past expenses, income, or savings for you. My purpose is to help you log new transactions one by one.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:51:03.23
aee5878f-1308-4a71-867e-8d0ff59c3f42	3f093e61-75d5-4764-b50d-8f40c8234dd0	USER	Based on this analytics data: Today you've spent $3069.00, saved $500.00, and earned $8200.00. and our conversation history, provide a personalized response.	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:51:15.852
614135ed-e8e1-497a-84be-ae10398e88ef	3f093e61-75d5-4764-b50d-8f40c8234dd0	ASSISTANT	That's great to see! Today you've spent $3069.00. I remember you've recorded things like mobile recharge and shoes before. It's fantastic that you've also saved $500.00 and earned $8200.00 today! You're doing a wonderful job tracking!	TEXT	\N	\N	\N	\N	\N	2025-06-28 08:51:17.385
\.


--
-- Data for Name: conversation_memory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."conversation_memory" ("id", "sessionId", "memoryType", "content", "summary", "keywords", "importance", "relatedMessageIds", "entityType", "entityId", "accessCount", "lastAccessedAt", "expiresAt", "createdAt", "updatedAt") FROM stdin;
cmcfefz8c0001lo68me8t4gyy	test-session-1	ENTITY	Okay, I've added your $200.00 expense for shoes from yesterday.	expense: 200.00	{expense,200.00}	8	\N	expense	200.00	0	2025-06-27 22:44:10.909	\N	2025-06-27 22:44:10.909	2025-06-27 22:44:10.909
cmcfenmt20003lo68n5g3sjd1	test-session-1	ENTITY	Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.	expense: 1000	{expense,1000}	8	\N	expense	1000	0	2025-06-27 22:50:08.055	\N	2025-06-27 22:50:08.055	2025-06-27 22:50:08.055
cmcfesqme0001louc84ucmxls	test-session-1	ENTITY	Great! I've recorded your $40.00 expense for snacks.	expense: 40.00	{expense,40.00}	8	\N	expense	40.00	0	2025-06-27 22:54:06.278	\N	2025-06-27 22:54:06.278	2025-06-27 22:54:06.278
cmcfykbcq0001loy8hzak0qqw	test-session-3	ENTITY	I've recorded your $700.00 income from your mom.	expense: 700.00	{expense,700.00}	8	\N	expense	700.00	0	2025-06-28 08:07:25.561	\N	2025-06-28 08:07:25.561	2025-06-28 08:07:25.561
cmcfymw680001lokwp9x9miab	test-session-4	ENTITY	I've recorded your $700.00 income from your mom.	expense: 700.00	{expense,700.00}	8	\N	expense	700.00	0	2025-06-28 08:09:25.856	\N	2025-06-28 08:09:25.856	2025-06-28 08:09:25.856
cmcfynt2t0001lor4y1ilo9p5	test-session-5	ENTITY	I've recorded your $700.00 income from your mom.	expense: 700.00	{expense,700.00}	8	\N	expense	700.00	0	2025-06-28 08:10:08.501	\N	2025-06-28 08:10:08.501	2025-06-28 08:10:08.501
cmcfyo7sa0005lor4w42onao7	test-session-6	ENTITY	I spent 25 dollars on lunch at McDonald's	merchant: Mc	{merchant,Mc}	8	\N	merchant	Mc	0	2025-06-28 08:10:27.562	\N	2025-06-28 08:10:27.562	2025-06-28 08:10:27.562
cmcfyo8yq0007lor4mcqew0pp	test-session-6	ENTITY	I've recorded your $25.00 expense for lunch at McDonald's.	expense: 25.00	{expense,25.00}	8	\N	expense	25.00	0	2025-06-28 08:10:29.091	\N	2025-06-28 08:10:29.091	2025-06-28 08:10:29.091
cmcfyo9620009lor49er1sapx	test-session-6	ENTITY	I've recorded your $25.00 expense for lunch at McDonald's.	merchant: Mc	{merchant,Mc}	8	\N	merchant	Mc	0	2025-06-28 08:10:29.355	\N	2025-06-28 08:10:29.355	2025-06-28 08:10:29.355
cmcfyoi2u000blor4py6gavwr	test-session-7	ENTITY	I've recorded your $500.00 savings for your emergency fund.	expense: 500.00	{expense,500.00}	8	\N	expense	500.00	0	2025-06-28 08:10:40.902	\N	2025-06-28 08:10:40.902	2025-06-28 08:10:40.902
cmcfyp3fx0001loxclin6tj6l	final-test	ENTITY	I've recorded your $2000.00 income from freelance work.	expense: 2000.00	{expense,2000.00}	8	\N	expense	2000.00	0	2025-06-28 08:11:08.589	\N	2025-06-28 08:11:08.589	2025-06-28 08:11:08.589
cmcfyrt6z0005loxcqnl0gewn	test-session-1	ENTITY	I've recorded your $4000.00 income from your monthly salary.	expense: 4000.00	{expense,4000.00}	8	\N	expense	4000.00	0	2025-06-28 08:13:15.276	\N	2025-06-28 08:13:15.276	2025-06-28 08:13:15.276
cmcfyw3ld0009loxc3vka6yva	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.	Conversation summary: 10 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:16:35.377	\N	2025-06-28 08:16:35.377	2025-06-28 08:16:35.377
cmcfyw4wj000bloxc3n4mgu8h	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: 	Conversation summary: 11 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:16:37.075	\N	2025-06-28 08:16:37.075	2025-06-28 08:16:37.075
cmcfyxal3000dloxc9o5fvoho	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: 	Conversation summary: 12 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:17:31.095	\N	2025-06-28 08:17:31.095	2025-06-28 08:17:31.095
cmcfyxat7000floxc7hjtc1aa	test-session-1	ENTITY	Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.	expense: 140.50	{expense,140.50}	8	\N	expense	140.50	0	2025-06-28 08:17:31.388	\N	2025-06-28 08:17:31.388	2025-06-28 08:17:31.388
cmcfyxb1a000hloxc7vy75ugt	test-session-1	ENTITY	Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.	expense: 25	{expense,25}	8	\N	expense	25	0	2025-06-28 08:17:31.679	\N	2025-06-28 08:17:31.679	2025-06-28 08:17:31.679
cmcfyxb9f000jloxcx8uobybr	test-session-1	ENTITY	Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.	expense: 30	{expense,30}	8	\N	expense	30	0	2025-06-28 08:17:31.971	\N	2025-06-28 08:17:31.971	2025-06-28 08:17:31.971
cmcfyxbhn000lloxcbpn81o74	test-session-1	ENTITY	Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.	expense: 5	{expense,5}	8	\N	expense	5	0	2025-06-28 08:17:32.267	\N	2025-06-28 08:17:32.267	2025-06-28 08:17:32.267
cmcfyxc5w000nloxcxa9uo58h	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: 	Conversation summary: 13 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:17:33.141	\N	2025-06-28 08:17:33.141	2025-06-28 08:17:33.141
cmcfz0hht0001lobk3ibhzy43	test-fix-session	ENTITY	I've recorded your $2000.00 expense for groceries.	expense: 2000.00	{expense,2000.00}	8	\N	expense	2000.00	0	2025-06-28 08:20:00.017	\N	2025-06-28 08:20:00.017	2025-06-28 08:20:00.017
cmcfz33nz0001loe8avwut4ds	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: 	Conversation summary: 14 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:22:02.063	\N	2025-06-28 08:22:02.063	2025-06-28 08:22:02.063
cmcfz34t60003loe8vlkv7iy7	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: 	Conversation summary: 15 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:22:03.546	\N	2025-06-28 08:22:03.546	2025-06-28 08:22:03.546
cmcfz35080005loe8ctljxc3q	test-session-1	ENTITY	I've recorded your $1000.00 expense for groceries.	expense: 1000.00	{expense,1000.00}	8	\N	expense	1000.00	0	2025-06-28 08:22:03.8	\N	2025-06-28 08:22:03.8	2025-06-28 08:22:03.8
cmcfz6vau0001lo0kr2v2vkkf	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom 	Conversation summary: 16 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:24:57.846	\N	2025-06-28 08:24:57.846	2025-06-28 08:24:57.846
cmcfz6whb0003lo0kx39h0n9o	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊	Conversation summary: 17 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:24:59.375	\N	2025-06-28 08:24:59.375	2025-06-28 08:24:59.375
cmcfz6won0005lo0kdwxnsqbd	test-session-1	ENTITY	I've recorded your $1500.00 income from your grandmother.	expense: 1500.00	{expense,1500.00}	8	\N	expense	1500.00	0	2025-06-28 08:24:59.64	\N	2025-06-28 08:24:59.64	2025-06-28 08:24:59.64
cmcg04phm0009lom4g0rchatp	test-session-1	ENTITY	Based on this analytics data: Today you've spent $3069.00, saved $500.00, and earned $8200.00. and our conversation history, provide a personalized response.	expense: 500.00	{expense,500.00}	8	\N	expense	500.00	0	2025-06-28 08:51:16.618	\N	2025-06-28 08:51:16.618	2025-06-28 08:51:16.618
cmcg04poq000blom4blirqsce	test-session-1	ENTITY	Based on this analytics data: Today you've spent $3069.00, saved $500.00, and earned $8200.00. and our conversation history, provide a personalized response.	expense: 8200.00	{expense,8200.00}	8	\N	expense	8200.00	0	2025-06-28 08:51:16.875	\N	2025-06-28 08:51:16.875	2025-06-28 08:51:16.875
cmcfz87nv0009lo0knpejvqwk	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd	Conversation summary: 18 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:26:00.523	\N	2025-06-28 08:26:00.523	2025-06-28 08:26:00.523
cmcfz88uc000blo0kchv4ciad	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.	Conversation summary: 19 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:26:02.053	\N	2025-06-28 08:26:02.053	2025-06-28 08:26:02.053
cmcfz8dvc000dlo0keq4uou8r	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses	Conversation summary: 20 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:26:08.516	\N	2025-06-28 08:26:08.516	2025-06-28 08:26:08.516
cmcfz8eh6000flo0k02l2o5tc	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?	Conversation summary: 21 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:26:09.354	\N	2025-06-28 08:26:09.354	2025-06-28 08:26:09.354
cmcfz9676000hlo0kv77apbjg	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.	Conversation summary: 22 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:26:45.282	\N	2025-06-28 08:26:45.282	2025-06-28 08:26:45.282
cmcfz97d4000jlo0kdphygijl	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊	Conversation summary: 23 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:26:46.793	\N	2025-06-28 08:26:46.793	2025-06-28 08:26:46.793
cmcfz97kb000llo0kzqrht2y4	test-session-1	ENTITY	I've recorded your $44.00 expense for zoo fees.	expense: 44.00	{expense,44.00}	8	\N	expense	44.00	0	2025-06-28 08:26:47.052	\N	2025-06-28 08:26:47.052	2025-06-28 08:26:47.052
cmcfz9zi2000nlo0kddo3l8qp	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊\nuser: spent 1000 dollars and i want you to put it under the grocery category	Conversation summary: 24 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:27:23.259	\N	2025-06-28 08:27:23.259	2025-06-28 08:27:23.259
cmcfza0o7000plo0k5w3133z3	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊\nuser: spent 1000 dollars and i want you to put it under the grocery category\nassistant: I've recorded your $1000.00 expense for groceries.	Conversation summary: 25 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:27:24.775	\N	2025-06-28 08:27:24.775	2025-06-28 08:27:24.775
cmcfza8r6000rlo0kmm4sjm25	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊\nuser: spent 1000 dollars and i want you to put it under the grocery category\nassistant: I've recorded your $1000.00 expense for groceries.\nuser: my grany gave me 1500 dollar today	Conversation summary: 26 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:27:35.25	\N	2025-06-28 08:27:35.25	2025-06-28 08:27:35.25
cmcfza9cp000tlo0ksrqbf7go	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊\nuser: spent 1000 dollars and i want you to put it under the grocery category\nassistant: I've recorded your $1000.00 expense for groceries.\nuser: my grany gave me 1500 dollar today\nassistant: I've recorded your $1500.00 income from your grandmother.	Conversation summary: 27 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:27:36.026	\N	2025-06-28 08:27:36.026	2025-06-28 08:27:36.026
cmcfzevam0001lo90oy9p0r8h	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊\nuser: spent 1000 dollars and i want you to put it under the grocery category\nassistant: I've recorded your $1000.00 expense for groceries.\nuser: my grany gave me 1500 dollar today\nassistant: I've recorded your $1500.00 income from your grandmother.\nuser: i spent	Conversation summary: 28 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:31:11.087	\N	2025-06-28 08:31:11.087	2025-06-28 08:31:11.087
cmcfzewix0003lo90besfqr70	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊\nuser: spent 1000 dollars and i want you to put it under the grocery category\nassistant: I've recorded your $1000.00 expense for groceries.\nuser: my grany gave me 1500 dollar today\nassistant: I've recorded your $1500.00 income from your grandmother.\nuser: i spent\nassistant: I'd be happy to help! How much did you spend and what was it for?	Conversation summary: 29 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:31:12.681	\N	2025-06-28 08:31:12.681	2025-06-28 08:31:12.681
cmcfzf6ry0005lo902j0bad0t	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊\nuser: spent 1000 dollars and i want you to put it under the grocery category\nassistant: I've recorded your $1000.00 expense for groceries.\nuser: my grany gave me 1500 dollar today\nassistant: I've recorded your $1500.00 income from your grandmother.\nuser: i spent\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: i spent	Conversation summary: 30 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:31:25.966	\N	2025-06-28 08:31:25.966	2025-06-28 08:31:25.966
cmcfzf6zn0007lo90snj55doh	test-session-1	ENTITY	Based on this analytics data: Today you've spent $3069.00, saved $500.00, and earned $8200.00. and our conversation history, provide a personalized response.	expense: 3069.00	{expense,3069.00}	8	\N	expense	3069.00	0	2025-06-28 08:31:26.244	\N	2025-06-28 08:31:26.244	2025-06-28 08:31:26.244
cmcfzf77a0009lo908hpre7c3	test-session-1	ENTITY	Based on this analytics data: Today you've spent $3069.00, saved $500.00, and earned $8200.00. and our conversation history, provide a personalized response.	expense: 500.00	{expense,500.00}	8	\N	expense	500.00	0	2025-06-28 08:31:26.518	\N	2025-06-28 08:31:26.518	2025-06-28 08:31:26.518
cmcfzf7ew000blo90axny0mu8	test-session-1	ENTITY	Based on this analytics data: Today you've spent $3069.00, saved $500.00, and earned $8200.00. and our conversation history, provide a personalized response.	expense: 8200.00	{expense,8200.00}	8	\N	expense	8200.00	0	2025-06-28 08:31:26.792	\N	2025-06-28 08:31:26.792	2025-06-28 08:31:26.792
cmcfzf81m000dlo90r06clj3q	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊\nuser: spent 1000 dollars and i want you to put it under the grocery category\nassistant: I've recorded your $1000.00 expense for groceries.\nuser: my grany gave me 1500 dollar today\nassistant: I've recorded your $1500.00 income from your grandmother.\nuser: i spent\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: i spent\nassistant: Okay, I can record that for you! How much did you spend and what was it for?	Conversation summary: 31 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:31:27.611	\N	2025-06-28 08:31:27.611	2025-06-28 08:31:27.611
cmcfzf899000flo904xl9iizm	test-session-1	ENTITY	Thanks for sharing that! It looks like today you've spent $3069.00. I recall you've logged expenses like mobile recharge and shoes in the past. It's great to see you've also saved $500.00 and earned $8200.00! Keep up the excellent tracking!	expense: 3069.00	{expense,3069.00}	8	\N	expense	3069.00	0	2025-06-28 08:31:27.885	\N	2025-06-28 08:31:27.885	2025-06-28 08:31:27.885
cmcfzf8gu000hlo90nrpuy1v4	test-session-1	ENTITY	Thanks for sharing that! It looks like today you've spent $3069.00. I recall you've logged expenses like mobile recharge and shoes in the past. It's great to see you've also saved $500.00 and earned $8200.00! Keep up the excellent tracking!	expense: 500.00	{expense,500.00}	8	\N	expense	500.00	0	2025-06-28 08:31:28.158	\N	2025-06-28 08:31:28.158	2025-06-28 08:31:28.158
cmcfzf8of000jlo90h58un7fn	test-session-1	ENTITY	Thanks for sharing that! It looks like today you've spent $3069.00. I recall you've logged expenses like mobile recharge and shoes in the past. It's great to see you've also saved $500.00 and earned $8200.00! Keep up the excellent tracking!	expense: 8200.00	{expense,8200.00}	8	\N	expense	8200.00	0	2025-06-28 08:31:28.431	\N	2025-06-28 08:31:28.431	2025-06-28 08:31:28.431
cmcg04e6t0001lom43168hu72	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊\nuser: spent 1000 dollars and i want you to put it under the grocery category\nassistant: I've recorded your $1000.00 expense for groceries.\nuser: my grany gave me 1500 dollar today\nassistant: I've recorded your $1500.00 income from your grandmother.\nuser: i spent\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: i spent\nassistant: Okay, I can record that for you! How much did you spend and what was it for?\nuser: it was 44 dollars and for the zoo fees	Conversation summary: 32 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:51:01.973	\N	2025-06-28 08:51:01.973	2025-06-28 08:51:01.973
cmcg04fcz0003lom47zad7q3n	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊\nuser: spent 1000 dollars and i want you to put it under the grocery category\nassistant: I've recorded your $1000.00 expense for groceries.\nuser: my grany gave me 1500 dollar today\nassistant: I've recorded your $1500.00 income from your grandmother.\nuser: i spent\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: i spent\nassistant: Okay, I can record that for you! How much did you spend and what was it for?\nuser: it was 44 dollars and for the zoo fees\nassistant: I've recorded your $44.00 expense for zoo fees.	Conversation summary: 33 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:51:03.491	\N	2025-06-28 08:51:03.491	2025-06-28 08:51:03.491
cmcg04p3d0005lom47o043urz	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊\nuser: spent 1000 dollars and i want you to put it under the grocery category\nassistant: I've recorded your $1000.00 expense for groceries.\nuser: my grany gave me 1500 dollar today\nassistant: I've recorded your $1500.00 income from your grandmother.\nuser: i spent\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: i spent\nassistant: Okay, I can record that for you! How much did you spend and what was it for?\nuser: it was 44 dollars and for the zoo fees\nassistant: I've recorded your $44.00 expense for zoo fees.\nuser: how can i know my expenses for today and also the savings and income?	Conversation summary: 34 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:51:16.106	\N	2025-06-28 08:51:16.106	2025-06-28 08:51:16.106
cmcg04pah0007lom4mkt7gck7	test-session-1	ENTITY	Based on this analytics data: Today you've spent $3069.00, saved $500.00, and earned $8200.00. and our conversation history, provide a personalized response.	expense: 3069.00	{expense,3069.00}	8	\N	expense	3069.00	0	2025-06-28 08:51:16.361	\N	2025-06-28 08:51:16.361	2025-06-28 08:51:16.361
cmcg04q9z000dlom4pts4lo68	test-session-1	CONTEXT	USER: spent 50 dollar on mobile reacharge\nASSISTANT: Got it! I've recorded your $50.00 expense for mobile recharge.\nUSER: i also bought 200 dollar shoes  yesterday\nASSISTANT: Okay, I've added your $200.00 expense for shoes from yesterday.\nUSER: no i mean i have 1000 dollar savings with me\nASSISTANT: I can only help track expenses. This sounds like a savings update rather than a new expense. Would you like to record an expense?\nUSER: can you tell me what i asked you last time?\nASSISTANT: Last time, you mentioned you had $1000 in savings, and I clarified that I track expenses, not savings. I then asked if you wanted to record an expense.\nUSER: i spent 40 dollar on snacks now\nASSISTANT: Great! I've recorded your $40.00 expense for snacks.\nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nASSISTANT: \nuser: i got 700 usd from my mom \nassistant: That's wonderful! I'm here to help you track your expenses. Just let me know when you make a purchase! 😊\nuser: my salary came for this month 4000 usd\nassistant: I've recorded your $4000.00 income from your monthly salary.\nuser: i will add this item in my expenses\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: Based on this analytics data: Your recent expenses total $140.50 across 6 transactions. Recent spending: $25 on Lunch, $30 on lunch, $5 on lunch. and our conversation history, provide a personalized response.\nassistant: Thanks for sharing your spending habits! To add this new item, could you tell me how much it was and what you bought? 😊\nuser: spent 1000 dollars and i want you to put it under the grocery category\nassistant: I've recorded your $1000.00 expense for groceries.\nuser: my grany gave me 1500 dollar today\nassistant: I've recorded your $1500.00 income from your grandmother.\nuser: i spent\nassistant: I'd be happy to help! How much did you spend and what was it for?\nuser: i spent\nassistant: Okay, I can record that for you! How much did you spend and what was it for?\nuser: it was 44 dollars and for the zoo fees\nassistant: I've recorded your $44.00 expense for zoo fees.\nuser: how can i know my expenses for today and also the savings and income?\nassistant: I can help you record your transactions, but I don't have the ability to track or summarize your past expenses, income, or savings. My function is to process and categorize new transactions as you provide them.	Conversation summary: 35 messages covering topics: dollar, mobile, reacharge, recorded, your, expense, recharge, also, bought, shoes	{dollar,mobile,reacharge,recorded,your,expense,recharge,also,bought,shoes}	8	\N	\N	\N	0	2025-06-28 08:51:17.639	\N	2025-06-28 08:51:17.639	2025-06-28 08:51:17.639
cmcg04qh1000flom4jx8ujwr6	test-session-1	ENTITY	That's great to see! Today you've spent $3069.00. I remember you've recorded things like mobile recharge and shoes before. It's fantastic that you've also saved $500.00 and earned $8200.00 today! You're doing a wonderful job tracking!	expense: 3069.00	{expense,3069.00}	8	\N	expense	3069.00	0	2025-06-28 08:51:17.893	\N	2025-06-28 08:51:17.893	2025-06-28 08:51:17.893
cmcg04qo5000hlom457ryubin	test-session-1	ENTITY	That's great to see! Today you've spent $3069.00. I remember you've recorded things like mobile recharge and shoes before. It's fantastic that you've also saved $500.00 and earned $8200.00 today! You're doing a wonderful job tracking!	expense: 500.00	{expense,500.00}	8	\N	expense	500.00	0	2025-06-28 08:51:18.149	\N	2025-06-28 08:51:18.149	2025-06-28 08:51:18.149
cmcg04qvb000jlom4l3vvs2g7	test-session-1	ENTITY	That's great to see! Today you've spent $3069.00. I remember you've recorded things like mobile recharge and shoes before. It's fantastic that you've also saved $500.00 and earned $8200.00 today! You're doing a wonderful job tracking!	expense: 8200.00	{expense,8200.00}	8	\N	expense	8200.00	0	2025-06-28 08:51:18.407	\N	2025-06-28 08:51:18.407	2025-06-28 08:51:18.407
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."expenses" ("id", "userId", "amount", "description", "category", "subcategory", "merchant", "location", "transactionDate", "createdAt", "updatedAt", "extractionMethod", "aiConfidence", "originalInput", "isVerified", "tags", "notes", "receiptUrl", "isRecurring", "recurringGroupId", "budgetCategory", "isBusinessExpense", "taxDeductible", "chatSessionId") FROM stdin;
\.


--
-- Data for Name: income; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."income" ("id", "userId", "amount", "description", "category", "source", "transactionDate", "createdAt", "updatedAt", "isRecurring", "recurringGroupId", "isGross", "taxWithheld", "extractionMethod", "aiConfidence", "originalInput", "tags", "notes", "chatSessionId") FROM stdin;
cmcfynta70003lor4la2bj6mq	1	700.00	Money from mom	Other	Unknown	2025-06-28 00:00:00	2025-06-28 08:10:08.768	2025-06-28 08:10:08.768	f	\N	t	\N	AI_CHAT	0.95	i got 700 usd from my mom	{}	\N	\N
cmcfyp3n30003loxcpsxzwkx6	1	2000.00	freelance work	Other	Unknown	2025-06-28 00:00:00	2025-06-28 08:11:08.848	2025-06-28 08:11:08.848	f	\N	t	\N	AI_CHAT	0.95	i earned 2000 from freelance work	{}	\N	\N
cmcfyrte80007loxcmhjeprwi	1	4000.00	Monthly salary	Other	Unknown	2025-06-28 00:00:00	2025-06-28 08:13:15.536	2025-06-28 08:13:15.536	f	\N	t	\N	AI_CHAT	0.95	my salary came for this month 4000 usd	{}	\N	\N
cmcfz6ww00007lo0kejza059t	1	1500.00	Gift from grandmother	Other	Unknown	2025-06-28 00:00:00	2025-06-28 08:24:59.904	2025-06-28 08:24:59.904	f	\N	t	\N	AI_CHAT	0.95	my grany gave me 1500 dollar today	{}	\N	\N
\.


--
-- Data for Name: savings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."savings" ("id", "userId", "amount", "description", "category", "account", "goalName", "transactionDate", "createdAt", "updatedAt", "savingsType", "targetAmount", "targetDate", "interestRate", "compoundFrequency", "extractionMethod", "aiConfidence", "originalInput", "tags", "notes", "chatSessionId") FROM stdin;
cmcfyoia5000dlor427h7bf67	1	500.00	Contribution to emergency fund	General Savings	\N	\N	2025-06-28 00:00:00	2025-06-28 08:10:41.165	2025-06-28 08:10:41.165	GENERAL	\N	\N	\N	\N	AI_CHAT	0.90	I put 500 into my emergency fund	{}	\N	\N
\.


--
-- Data for Name: system_metrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."system_metrics" ("id", "metricType", "metricValue", "metricUnit", "tags", "createdAt") FROM stdin;
\.


--
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."user_preferences" ("id", "userId", "defaultView", "darkMode", "notifications", "emailNotifications", "pushNotifications", "monthlyBudget", "expenseCategories", "incomeCategories", "savingsGoals", "aiAssistanceEnabled", "conversationMemoryDays", "aiConfidenceThreshold", "autoCategorizationEnabled", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."user_sessions" ("id", "userId", "token", "deviceInfo", "ipAddress", "userAgent", "isActive", "expiresAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") FROM stdin;
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads" ("id", "in_progress_size", "upload_signature", "bucket_id", "key", "version", "owner_id", "created_at", "user_metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads_parts" ("id", "upload_id", "size", "part_number", "bucket_id", "key", "etag", "owner_id", "version", "created_at") FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
