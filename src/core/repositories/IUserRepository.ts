import { RegisterUserRequest } from "../entities/interfaces/registerUserRequest";
import { User } from "../entities/model/User";

export interface IUserRepository {
  create(user: RegisterUserRequest): Promise<void>;
  getByEmail(email: string): Promise<User | null>;
  getById(id: string): Promise<User | null>;
  getAllUsers(): Promise<User[]>; 
}