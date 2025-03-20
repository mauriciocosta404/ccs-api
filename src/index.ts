import Fastify from "fastify";
import membroRoutes from "./presentation/routes/membroRoutes";

const fastify = Fastify({
  logger: true, 
});

fastify.register(membroRoutes, { prefix: "/api" });

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