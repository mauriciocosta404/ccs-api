import { FastifyInstance, FastifyReply, FastifyRequest } from "fastify";
import { UserController } from "../controllers/userController";

const userController = new UserController();

export default async function usersRoutes(fastify: FastifyInstance) {
  fastify.post("/users", async (request: FastifyRequest, reply: FastifyReply) => {
    return await userController.register(request, reply);
  });

  fastify.get("/users", async (request, reply) => {
    return await userController.getAllUsers(request, reply);
  });

  /*fastify.get("/membros/:id", async (request, reply) => {
    return await membroController.buscarPorId(request, reply);
  });*/
}