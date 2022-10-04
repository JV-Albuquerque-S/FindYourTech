-- CreateTable
CREATE TABLE "cellphones" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "price" DOUBLE PRECISION,
    "processor" TEXT NOT NULL,
    "RAM" INTEGER NOT NULL,
    "storage" INTEGER NOT NULL,
    "mAh" INTEGER NOT NULL,
    "have5G" BOOLEAN NOT NULL,
    "displayType" TEXT NOT NULL,
    "displaySize" DOUBLE PRECISION NOT NULL,
    "displayResolution" TEXT NOT NULL,
    "displayFPS" INTEGER NOT NULL,
    "OS" TEXT NOT NULL,
    "brand" TEXT NOT NULL,

    CONSTRAINT "cellphones_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cameraFeatures" (
    "id" SERIAL NOT NULL,
    "phoneId" INTEGER NOT NULL,
    "megaPixels" INTEGER NOT NULL,
    "apertureSize" DOUBLE PRECISION NOT NULL,
    "stabilization" TEXT NOT NULL,
    "macro" BOOLEAN NOT NULL,
    "panorama" BOOLEAN NOT NULL,
    "ultrawide" BOOLEAN NOT NULL,

    CONSTRAINT "cameraFeatures_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "videoFeatures" (
    "id" SERIAL NOT NULL,
    "phoneId" INTEGER NOT NULL,
    "maxRsolution" TEXT NOT NULL,
    "maxFPS" INTEGER NOT NULL,
    "slowmotion" BOOLEAN NOT NULL,
    "stereoSoundRec" BOOLEAN NOT NULL,

    CONSTRAINT "videoFeatures_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "accessories" (
    "id" SERIAL NOT NULL,
    "phoneId" INTEGER NOT NULL,
    "earphone" BOOLEAN NOT NULL,
    "charger" BOOLEAN NOT NULL,
    "chargerPower" INTEGER,
    "pen" BOOLEAN NOT NULL,
    "phoneCase" BOOLEAN NOT NULL,
    "screenProtector" BOOLEAN NOT NULL,

    CONSTRAINT "accessories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "userRating" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "phoneId" INTEGER NOT NULL,
    "rate" INTEGER NOT NULL,

    CONSTRAINT "userRating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Commentaries" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "phoneId" INTEGER NOT NULL,
    "commentary" TEXT NOT NULL,

    CONSTRAINT "Commentaries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserFavorites" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "phoneId" INTEGER NOT NULL,

    CONSTRAINT "UserFavorites_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "cellphones_name_key" ON "cellphones"("name");

-- AddForeignKey
ALTER TABLE "cameraFeatures" ADD CONSTRAINT "cameraFeatures_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "cellphones"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "videoFeatures" ADD CONSTRAINT "videoFeatures_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "cellphones"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "accessories" ADD CONSTRAINT "accessories_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "cellphones"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userRating" ADD CONSTRAINT "userRating_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userRating" ADD CONSTRAINT "userRating_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "cellphones"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Commentaries" ADD CONSTRAINT "Commentaries_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Commentaries" ADD CONSTRAINT "Commentaries_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "cellphones"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserFavorites" ADD CONSTRAINT "UserFavorites_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserFavorites" ADD CONSTRAINT "UserFavorites_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "cellphones"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
