

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


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE TYPE "public"."BudgetPeriod" AS ENUM (
    'WEEKLY',
    'MONTHLY',
    'QUARTERLY',
    'YEARLY'
);


ALTER TYPE "public"."BudgetPeriod" OWNER TO "postgres";


CREATE TYPE "public"."ExtractionMethod" AS ENUM (
    'MANUAL',
    'AI_CHAT',
    'AI_VOICE',
    'IMPORT',
    'API'
);


ALTER TYPE "public"."ExtractionMethod" OWNER TO "postgres";


CREATE TYPE "public"."ExtractionType" AS ENUM (
    'EXPENSE',
    'INCOME',
    'SAVINGS',
    'ANALYTICS',
    'GENERAL'
);


ALTER TYPE "public"."ExtractionType" OWNER TO "postgres";


CREATE TYPE "public"."MemoryType" AS ENUM (
    'SHORT_TERM',
    'LONG_TERM',
    'PREFERENCE',
    'ENTITY',
    'CONTEXT'
);


ALTER TYPE "public"."MemoryType" OWNER TO "postgres";


CREATE TYPE "public"."MessageRole" AS ENUM (
    'USER',
    'ASSISTANT',
    'SYSTEM'
);


ALTER TYPE "public"."MessageRole" OWNER TO "postgres";


CREATE TYPE "public"."MessageType" AS ENUM (
    'TEXT',
    'EXPENSE',
    'INCOME',
    'SAVINGS',
    'ANALYTICS',
    'ERROR'
);


ALTER TYPE "public"."MessageType" OWNER TO "postgres";


CREATE TYPE "public"."SavingsType" AS ENUM (
    'GENERAL',
    'EMERGENCY',
    'GOAL',
    'INVESTMENT',
    'RETIREMENT'
);


ALTER TYPE "public"."SavingsType" OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."_prisma_migrations" (
    "id" character varying(36) NOT NULL,
    "checksum" character varying(64) NOT NULL,
    "finished_at" timestamp with time zone,
    "migration_name" character varying(255) NOT NULL,
    "logs" "text",
    "rolled_back_at" timestamp with time zone,
    "started_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "applied_steps_count" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "public"."_prisma_migrations" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."ai_extraction_logs" (
    "id" "text" NOT NULL,
    "userId" "text" NOT NULL,
    "rawInput" "text" NOT NULL,
    "extractedData" "jsonb" NOT NULL,
    "aiResponse" "text" NOT NULL,
    "extractionType" "public"."ExtractionType" NOT NULL,
    "aiModel" "text" NOT NULL,
    "aiProvider" "text" NOT NULL,
    "confidenceScore" numeric(3,2) NOT NULL,
    "processingTimeMs" integer NOT NULL,
    "wasSuccessful" boolean NOT NULL,
    "needsFollowUp" boolean DEFAULT false NOT NULL,
    "userConfirmed" boolean,
    "correctionsMade" "jsonb",
    "sessionId" "text",
    "ipAddress" "text",
    "userAgent" "text",
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE "public"."ai_extraction_logs" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."analytics_cache" (
    "id" "text" NOT NULL,
    "userId" "text" NOT NULL,
    "cacheKey" "text" NOT NULL,
    "analyticsType" "text" NOT NULL,
    "data" "jsonb" NOT NULL,
    "parameters" "jsonb" NOT NULL,
    "isValid" boolean DEFAULT true NOT NULL,
    "hitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "lastAccessedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE "public"."analytics_cache" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."budgets" (
    "id" "text" NOT NULL,
    "userId" "text" NOT NULL,
    "name" "text" NOT NULL,
    "category" "text" NOT NULL,
    "budgetAmount" numeric(12,2) NOT NULL,
    "spentAmount" numeric(12,2) DEFAULT 0 NOT NULL,
    "period" "public"."BudgetPeriod" DEFAULT 'MONTHLY'::"public"."BudgetPeriod" NOT NULL,
    "startDate" timestamp(3) without time zone NOT NULL,
    "endDate" timestamp(3) without time zone,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE "public"."budgets" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."chat_messages" (
    "id" "text" NOT NULL,
    "sessionId" "text" NOT NULL,
    "role" "public"."MessageRole" NOT NULL,
    "content" "text" NOT NULL,
    "messageType" "public"."MessageType" DEFAULT 'TEXT'::"public"."MessageType" NOT NULL,
    "intent" "text",
    "confidence" numeric(3,2),
    "processingTimeMs" integer,
    "aiModel" "text",
    "tokenCount" integer,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE "public"."chat_messages" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."chat_sessions" (
    "id" "text" NOT NULL,
    "userId" "text" NOT NULL,
    "sessionId" "text" NOT NULL,
    "title" "text",
    "context" "text",
    "isActive" boolean DEFAULT true NOT NULL,
    "totalMessages" integer DEFAULT 0 NOT NULL,
    "totalExpenses" integer DEFAULT 0 NOT NULL,
    "totalIncome" integer DEFAULT 0 NOT NULL,
    "totalSavings" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "lastMessageAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE "public"."chat_sessions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."conversation_memory" (
    "id" "text" NOT NULL,
    "sessionId" "text" NOT NULL,
    "memoryType" "public"."MemoryType" NOT NULL,
    "content" "text" NOT NULL,
    "summary" "text",
    "keywords" "text"[],
    "importance" integer DEFAULT 1 NOT NULL,
    "relatedMessageIds" "text"[],
    "entityType" "text",
    "entityId" "text",
    "accessCount" integer DEFAULT 0 NOT NULL,
    "lastAccessedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "expiresAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE "public"."conversation_memory" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."expenses" (
    "id" "text" NOT NULL,
    "userId" "text" NOT NULL,
    "amount" numeric(12,2) NOT NULL,
    "description" "text" NOT NULL,
    "category" "text" NOT NULL,
    "subcategory" "text",
    "merchant" "text",
    "location" "text",
    "transactionDate" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "extractionMethod" "public"."ExtractionMethod" DEFAULT 'MANUAL'::"public"."ExtractionMethod" NOT NULL,
    "aiConfidence" numeric(3,2),
    "originalInput" "text",
    "isVerified" boolean DEFAULT false NOT NULL,
    "tags" "text"[],
    "notes" "text",
    "receiptUrl" "text",
    "isRecurring" boolean DEFAULT false NOT NULL,
    "recurringGroupId" "text",
    "budgetCategory" "text",
    "isBusinessExpense" boolean DEFAULT false NOT NULL,
    "taxDeductible" boolean DEFAULT false NOT NULL,
    "chatSessionId" "text"
);


ALTER TABLE "public"."expenses" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."income" (
    "id" "text" NOT NULL,
    "userId" "text" NOT NULL,
    "amount" numeric(12,2) NOT NULL,
    "description" "text" NOT NULL,
    "category" "text" NOT NULL,
    "source" "text" NOT NULL,
    "transactionDate" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "isRecurring" boolean DEFAULT false NOT NULL,
    "recurringGroupId" "text",
    "isGross" boolean DEFAULT true NOT NULL,
    "taxWithheld" numeric(12,2),
    "extractionMethod" "public"."ExtractionMethod" DEFAULT 'MANUAL'::"public"."ExtractionMethod" NOT NULL,
    "aiConfidence" numeric(3,2),
    "originalInput" "text",
    "tags" "text"[],
    "notes" "text",
    "chatSessionId" "text"
);


ALTER TABLE "public"."income" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."savings" (
    "id" "text" NOT NULL,
    "userId" "text" NOT NULL,
    "amount" numeric(12,2) NOT NULL,
    "description" "text" NOT NULL,
    "category" "text" NOT NULL,
    "account" "text",
    "goalName" "text",
    "transactionDate" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "savingsType" "public"."SavingsType" DEFAULT 'GENERAL'::"public"."SavingsType" NOT NULL,
    "targetAmount" numeric(12,2),
    "targetDate" timestamp(3) without time zone,
    "interestRate" numeric(5,4),
    "compoundFrequency" "text",
    "extractionMethod" "public"."ExtractionMethod" DEFAULT 'MANUAL'::"public"."ExtractionMethod" NOT NULL,
    "aiConfidence" numeric(3,2),
    "originalInput" "text",
    "tags" "text"[],
    "notes" "text",
    "chatSessionId" "text"
);


ALTER TABLE "public"."savings" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."system_metrics" (
    "id" "text" NOT NULL,
    "metricType" "text" NOT NULL,
    "metricValue" numeric(10,4) NOT NULL,
    "metricUnit" "text" NOT NULL,
    "tags" "jsonb",
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE "public"."system_metrics" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."user_preferences" (
    "id" "text" NOT NULL,
    "userId" "text" NOT NULL,
    "defaultView" "text" DEFAULT 'dashboard'::"text" NOT NULL,
    "darkMode" boolean DEFAULT false NOT NULL,
    "notifications" boolean DEFAULT true NOT NULL,
    "emailNotifications" boolean DEFAULT true NOT NULL,
    "pushNotifications" boolean DEFAULT true NOT NULL,
    "monthlyBudget" numeric(12,2),
    "expenseCategories" "text"[],
    "incomeCategories" "text"[],
    "savingsGoals" "jsonb",
    "aiAssistanceEnabled" boolean DEFAULT true NOT NULL,
    "conversationMemoryDays" integer DEFAULT 30 NOT NULL,
    "aiConfidenceThreshold" numeric(3,2) DEFAULT 0.8 NOT NULL,
    "autoCategorizationEnabled" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE "public"."user_preferences" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."user_sessions" (
    "id" "text" NOT NULL,
    "userId" "text" NOT NULL,
    "token" "text" NOT NULL,
    "deviceInfo" "text",
    "ipAddress" "text",
    "userAgent" "text",
    "isActive" boolean DEFAULT true NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE "public"."user_sessions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."users" (
    "id" "text" NOT NULL,
    "email" "text" NOT NULL,
    "emailVerified" boolean DEFAULT false NOT NULL,
    "password" "text",
    "firstName" "text",
    "lastName" "text",
    "profilePicture" "text",
    "timezone" "text" DEFAULT 'UTC'::"text" NOT NULL,
    "currency" "text" DEFAULT 'USD'::"text" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "lastLoginAt" timestamp(3) without time zone,
    "isActive" boolean DEFAULT true NOT NULL
);


ALTER TABLE "public"."users" OWNER TO "postgres";


ALTER TABLE ONLY "public"."_prisma_migrations"
    ADD CONSTRAINT "_prisma_migrations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."ai_extraction_logs"
    ADD CONSTRAINT "ai_extraction_logs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."analytics_cache"
    ADD CONSTRAINT "analytics_cache_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."budgets"
    ADD CONSTRAINT "budgets_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."chat_messages"
    ADD CONSTRAINT "chat_messages_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."chat_sessions"
    ADD CONSTRAINT "chat_sessions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."conversation_memory"
    ADD CONSTRAINT "conversation_memory_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."expenses"
    ADD CONSTRAINT "expenses_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."income"
    ADD CONSTRAINT "income_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."savings"
    ADD CONSTRAINT "savings_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."system_metrics"
    ADD CONSTRAINT "system_metrics_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."user_preferences"
    ADD CONSTRAINT "user_preferences_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."user_sessions"
    ADD CONSTRAINT "user_sessions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");



CREATE INDEX "ai_extraction_logs_aiModel_createdAt_idx" ON "public"."ai_extraction_logs" USING "btree" ("aiModel", "createdAt");



CREATE INDEX "ai_extraction_logs_userId_wasSuccessful_idx" ON "public"."ai_extraction_logs" USING "btree" ("userId", "wasSuccessful");



CREATE INDEX "analytics_cache_expiresAt_idx" ON "public"."analytics_cache" USING "btree" ("expiresAt");



CREATE INDEX "analytics_cache_userId_analyticsType_isValid_idx" ON "public"."analytics_cache" USING "btree" ("userId", "analyticsType", "isValid");



CREATE UNIQUE INDEX "analytics_cache_userId_cacheKey_key" ON "public"."analytics_cache" USING "btree" ("userId", "cacheKey");



CREATE INDEX "budgets_userId_period_isActive_idx" ON "public"."budgets" USING "btree" ("userId", "period", "isActive");



CREATE INDEX "chat_messages_role_messageType_idx" ON "public"."chat_messages" USING "btree" ("role", "messageType");



CREATE INDEX "chat_messages_sessionId_createdAt_idx" ON "public"."chat_messages" USING "btree" ("sessionId", "createdAt");



CREATE INDEX "chat_sessions_sessionId_idx" ON "public"."chat_sessions" USING "btree" ("sessionId");



CREATE UNIQUE INDEX "chat_sessions_sessionId_key" ON "public"."chat_sessions" USING "btree" ("sessionId");



CREATE INDEX "chat_sessions_userId_isActive_idx" ON "public"."chat_sessions" USING "btree" ("userId", "isActive");



CREATE INDEX "conversation_memory_importance_lastAccessedAt_idx" ON "public"."conversation_memory" USING "btree" ("importance", "lastAccessedAt");



CREATE INDEX "conversation_memory_sessionId_memoryType_idx" ON "public"."conversation_memory" USING "btree" ("sessionId", "memoryType");



CREATE INDEX "expenses_userId_category_idx" ON "public"."expenses" USING "btree" ("userId", "category");



CREATE INDEX "expenses_userId_isRecurring_idx" ON "public"."expenses" USING "btree" ("userId", "isRecurring");



CREATE INDEX "expenses_userId_transactionDate_idx" ON "public"."expenses" USING "btree" ("userId", "transactionDate");



CREATE INDEX "income_userId_category_idx" ON "public"."income" USING "btree" ("userId", "category");



CREATE INDEX "income_userId_isRecurring_idx" ON "public"."income" USING "btree" ("userId", "isRecurring");



CREATE INDEX "income_userId_transactionDate_idx" ON "public"."income" USING "btree" ("userId", "transactionDate");



CREATE INDEX "savings_userId_category_idx" ON "public"."savings" USING "btree" ("userId", "category");



CREATE INDEX "savings_userId_goalName_idx" ON "public"."savings" USING "btree" ("userId", "goalName");



CREATE INDEX "savings_userId_transactionDate_idx" ON "public"."savings" USING "btree" ("userId", "transactionDate");



CREATE INDEX "system_metrics_metricType_createdAt_idx" ON "public"."system_metrics" USING "btree" ("metricType", "createdAt");



CREATE UNIQUE INDEX "user_preferences_userId_key" ON "public"."user_preferences" USING "btree" ("userId");



CREATE UNIQUE INDEX "user_sessions_token_key" ON "public"."user_sessions" USING "btree" ("token");



CREATE UNIQUE INDEX "users_email_key" ON "public"."users" USING "btree" ("email");



ALTER TABLE ONLY "public"."ai_extraction_logs"
    ADD CONSTRAINT "ai_extraction_logs_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."budgets"
    ADD CONSTRAINT "budgets_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_messages"
    ADD CONSTRAINT "chat_messages_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "public"."chat_sessions"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_sessions"
    ADD CONSTRAINT "chat_sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."conversation_memory"
    ADD CONSTRAINT "conversation_memory_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "public"."chat_sessions"("sessionId") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."expenses"
    ADD CONSTRAINT "expenses_chatSessionId_fkey" FOREIGN KEY ("chatSessionId") REFERENCES "public"."chat_sessions"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."expenses"
    ADD CONSTRAINT "expenses_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."income"
    ADD CONSTRAINT "income_chatSessionId_fkey" FOREIGN KEY ("chatSessionId") REFERENCES "public"."chat_sessions"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."income"
    ADD CONSTRAINT "income_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."savings"
    ADD CONSTRAINT "savings_chatSessionId_fkey" FOREIGN KEY ("chatSessionId") REFERENCES "public"."chat_sessions"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."savings"
    ADD CONSTRAINT "savings_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user_preferences"
    ADD CONSTRAINT "user_preferences_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user_sessions"
    ADD CONSTRAINT "user_sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;





ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";








































































































































































GRANT ALL ON TABLE "public"."_prisma_migrations" TO "anon";
GRANT ALL ON TABLE "public"."_prisma_migrations" TO "authenticated";
GRANT ALL ON TABLE "public"."_prisma_migrations" TO "service_role";



GRANT ALL ON TABLE "public"."ai_extraction_logs" TO "anon";
GRANT ALL ON TABLE "public"."ai_extraction_logs" TO "authenticated";
GRANT ALL ON TABLE "public"."ai_extraction_logs" TO "service_role";



GRANT ALL ON TABLE "public"."analytics_cache" TO "anon";
GRANT ALL ON TABLE "public"."analytics_cache" TO "authenticated";
GRANT ALL ON TABLE "public"."analytics_cache" TO "service_role";



GRANT ALL ON TABLE "public"."budgets" TO "anon";
GRANT ALL ON TABLE "public"."budgets" TO "authenticated";
GRANT ALL ON TABLE "public"."budgets" TO "service_role";



GRANT ALL ON TABLE "public"."chat_messages" TO "anon";
GRANT ALL ON TABLE "public"."chat_messages" TO "authenticated";
GRANT ALL ON TABLE "public"."chat_messages" TO "service_role";



GRANT ALL ON TABLE "public"."chat_sessions" TO "anon";
GRANT ALL ON TABLE "public"."chat_sessions" TO "authenticated";
GRANT ALL ON TABLE "public"."chat_sessions" TO "service_role";



GRANT ALL ON TABLE "public"."conversation_memory" TO "anon";
GRANT ALL ON TABLE "public"."conversation_memory" TO "authenticated";
GRANT ALL ON TABLE "public"."conversation_memory" TO "service_role";



GRANT ALL ON TABLE "public"."expenses" TO "anon";
GRANT ALL ON TABLE "public"."expenses" TO "authenticated";
GRANT ALL ON TABLE "public"."expenses" TO "service_role";



GRANT ALL ON TABLE "public"."income" TO "anon";
GRANT ALL ON TABLE "public"."income" TO "authenticated";
GRANT ALL ON TABLE "public"."income" TO "service_role";



GRANT ALL ON TABLE "public"."savings" TO "anon";
GRANT ALL ON TABLE "public"."savings" TO "authenticated";
GRANT ALL ON TABLE "public"."savings" TO "service_role";



GRANT ALL ON TABLE "public"."system_metrics" TO "anon";
GRANT ALL ON TABLE "public"."system_metrics" TO "authenticated";
GRANT ALL ON TABLE "public"."system_metrics" TO "service_role";



GRANT ALL ON TABLE "public"."user_preferences" TO "anon";
GRANT ALL ON TABLE "public"."user_preferences" TO "authenticated";
GRANT ALL ON TABLE "public"."user_preferences" TO "service_role";



GRANT ALL ON TABLE "public"."user_sessions" TO "anon";
GRANT ALL ON TABLE "public"."user_sessions" TO "authenticated";
GRANT ALL ON TABLE "public"."user_sessions" TO "service_role";



GRANT ALL ON TABLE "public"."users" TO "anon";
GRANT ALL ON TABLE "public"."users" TO "authenticated";
GRANT ALL ON TABLE "public"."users" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";






























RESET ALL;
