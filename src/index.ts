import Fastify from "fastify";
import userRoutes from "./presentation/routes/user";
import { errorHandler } from "./shared/middlewares/errorHandler";

const fastify = Fastify({
  logger: true, 
});

fastify.register(userRoutes, { prefix: "/api" });

fastify.setErrorHandler(errorHandler);

const start = async () => {
  try {
    await fastify.listen({ port: 3000 });
    console.log("Servidor rodando na porta 3000 🚀🚀🎇🎆♨️♨️");
  } catch (err) {
    fastify.log.error(err);
    process.exit(1);
  }
};

start();