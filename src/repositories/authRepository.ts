import { User } from "@prisma/client"
import { prisma } from "../database";


export type CreateUserData = Omit<User, "id">;

export async function findById(id: number) {
    return prisma.user.findUnique({
        where: {
            id,
        },
    });
}
export async function findByEmail(email: string) {
    return prisma.user.findUnique({
        where: {
            email,
        },
    });
}
  
export async function insert(createUserData: CreateUserData) {
    return prisma.user.create({
        data: createUserData,
    });
}