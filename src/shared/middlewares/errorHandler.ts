import { FastifyRequest, FastifyReply } from "fastify";
import { AppError } from "../errors/AppError";

export const errorHandler = (
  error: Error,
  request: FastifyRequest,
  reply: FastifyReply
) => {
  if (error instanceof AppError) {
    return reply.status(error.statusCode).send({
      status: "error",
      message: error.message,
    });
  }

  console.error(error); // Log do erro para debug
  return reply.status(500).send({
    status: "error",
    message: "Erro interno no servidor.",
  });
};