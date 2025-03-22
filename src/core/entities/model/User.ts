import { UserRole } from "@prisma/client";

export class User {
  constructor(
    public id: string,
    public name: string,
    public email: string,
    public senha: string,
    public role: UserRole,
    public createdAt?: Date,
    public updatedAt?: Date
  ) {}
}