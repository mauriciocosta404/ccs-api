import { User } from "./User";

export class Escala {
  constructor(
    public id: string,
    public data: Date,
    public pregador: User,
    public dirigente: User,
    public createdAt?: Date,
    public updatedAt?: Date
  ) {}
}