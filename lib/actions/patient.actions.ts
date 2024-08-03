"use server";

import { ID, Query } from "node-appwrite";
import { users } from "../appwrite.config";
// import { undefined } from "zod";


export const createUser = async (user: CreateUserParams) => {
    try {
        const newUser = await users.create(
            ID.unique(), 
            user.email,
            user.phone,
            "", 
            user.name)
    } catch (error: any) {
        if (error && error?.code === 409) {
            const documnents = await users.list([
                Query.equal("email", [user.email])
            ])

            return documnents?.users[0]
        }        
    }
};