/* eslint-disable @babel/new-cap */
import Fastify from "fastify"
import fastifyView from "@fastify/view"
import ejs from "ejs"
import { home } from "./actions/home.js"
import fastifyFormbody from "@fastify/formbody"
import fastifyCookie from "@fastify/cookie"
import fastifySecureSession from "@fastify/secure-session"
import { readFileSync } from "node:fs"
import { fileURLToPath } from "node:url"
import { dirname, join } from "node:path"
import fastifyFlash from "@fastify/flash"
import fastifyPostgres from "@fastify/postgres"

/**
 * Fastify
 */
export const fastify=Fastify()

/**
 * enregistrement des plugins
 */
fastify.register(fastifyView,{
    engine:{ejs}
})

fastify.register(fastifyFormbody)

fastify.register(fastifyCookie,{
    /* secret:"nodecookie", */
})

const dirPath=dirname(dirname(fileURLToPath(import.meta.url)));
const joinPath=join(dirPath,"secret-key");

fastify.register(fastifySecureSession,{
    cookieName:"NODESession",
    key:readFileSync(joinPath),
    cookie:{
        path:"/"
    }
})

fastify.register(fastifyFlash)


fastify.register(fastifyPostgres,{
    host:"localhost",
    database:"livre_dor",
    user:"root",
    password:"root"
})


/**
 * route
 */
fastify.get("/",home)

fastify.post("/",home)


/**
 * server port
 */
fastify.listen({port:8000})
