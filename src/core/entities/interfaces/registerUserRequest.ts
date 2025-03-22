import { UserRole } from "@prisma/client";

export interface RegisterUserRequest {
    name: string;
    email: string;
    senha: string;
    role?: UserRole; 
  }