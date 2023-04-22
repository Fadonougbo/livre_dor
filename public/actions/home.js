import { fastify } from "../index.js";


/**
 * 
 * @param {string} name user name
 * @param {string} content user commente
 * @returns  Promise
 */

const insertElement=async (name,content)=>{

    try
    {
        const client=await fastify.pg.connect()
        const query="INSERT INTO userinfo (name,content) VALUES($1,$2)"
        const res=client.query(query,[name,content])
        client.release()

        return res

    }catch(e)
    {
        console.log(e.message,"message insertion dans la DB")
    }

}

/**
 * Get all commentes list
 * @returns Promise
 */
const readElements=async ()=>{
    try
    {
        const client=await fastify.pg.connect()
        const query="SELECT * FROM userinfo ORDER BY created_at DESC"
        const res=client.query(query)
        client.release()

        return res

    }catch(e)
    {
        console.log(e.message,"messages read dans la DB")
    }
}

/**
 * 
 * @param {Object} req request
 * @param {Object} res response
 * @returns Promise
 */
export const home=async (req,res)=>{

    const title="liver d'or";
    let body={};

    if(req.method==="POST")
    {
              body=req.body
        const {name,content}=body

        if(content===""||name==="")
        {
            req.flash("emptyForm","Veillez Remplire tous les champs")
        }else 
        {
            /**
             * Insert element in database
             */
            const rows=await insertElement(name,content)

            if(rows.rowCount>1)
            {
                req.flash("valideForm","Message envoyé")
                return res.redirect("/")
            }
            

        }
    }

    const emptyForm=(res.flash("emptyForm")[0])||'';
    const valideForm=(res.flash("valideForm")[0])||'';

    /**
     * Database elements
     */
    const {rows}=await readElements();

  return res.view("public/views/home.ejs",{title,emptyForm,valideForm,body,rows});
}