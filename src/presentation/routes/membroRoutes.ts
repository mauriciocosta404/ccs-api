import { FastifyInstance, FastifyReply, FastifyRequest } from "fastify";
import { MembroController } from "../controllers/membroController";

const membroController = new MembroController();

export default async function membroRoutes(fastify: FastifyInstance) {
  fastify.post("/membros", async (request: FastifyRequest, reply: FastifyReply) => {
    return await membroController.cadastrar(request, reply);
  });

  /*fastify.get("/membros/:id", async (request, reply) => {
    return await membroController.buscarPorId(request, reply);
  });*/
}