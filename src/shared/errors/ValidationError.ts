import { AppError } from "./AppError";

export class ValidationError extends AppError {
  constructor(message: string = "Dados inválidos") {
    super(message, 400);
  }
}