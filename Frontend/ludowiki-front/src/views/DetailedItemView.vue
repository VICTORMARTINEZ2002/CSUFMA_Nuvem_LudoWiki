<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { useRoute } from 'vue-router'
import axios from '@/plugins/axios'
import ExpansaoCard from '@/components/ExpansaoCard.vue'

const route = useRoute()
const rawId = route.params.id
const id = Array.isArray(rawId) ? parseInt(rawId[0]) : parseInt(rawId)

const jogo = ref()
const extensoes = ref([])

const formatarDuracao = (duracao:string) => {
    const[h,m]=duracao.split(':')
    const horas=parseInt(h)
    const minutos=parseInt(m)
    if(horas>0)return `${horas}h ${minutos}min`
    return `${minutos} minutos`
}

onMounted(async () => {
    try {
        const jogoResponse = await axios.get(`/jogos/${id}`)
        jogo.value = jogoResponse.data

        const generoResponse = await axios.get(`/generos/${id}`)
        jogo.value.genero = generoResponse.data

        const extensaoResponse = await axios.get(`/extensoes/`)
        extensoes.value = extensaoResponse.data.filter((ext:any)=>ext.jogo_base===id)
        
    }catch(err){console.log('Erro ao buscar jogo ou gênero:', err)}
})
</script>

<template>
    <div class="jogo-container" v-if="jogo && jogo.nome">
        <h1 class="jogo-title">{{jogo.nome}}</h1>

        <div class="jogo-content">
            <img :src="jogo.img" :alt="jogo.nome" class="jogo-image" />
            <div class="jogo-details">
                <p class="descricao">{{jogo.descricao}}</p>
                <table class="detalhes-tabela">
                    <tbody>
                        <tr><th>Ano de Lançamento:</th><td>{{jogo.ano}}</td></tr>
                        <tr><th>Duração Média:</th><td>{{formatarDuracao(jogo.duracao)}}</td></tr>
                        <tr><th>Máx. Jogadores:</th><td>{{jogo.max_players}}</td></tr>
                        <tr><th>Gênero:</th><td>{{jogo.genero.nome}}</td></tr>
                        <tr><th>Manual:</th>
                            <td>
                                <a :href="jogo.manual" target="_blank" class="manual-link">Ver manual (PDF)</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div v-if="extensoes.length">
            <h2 class="extensao-title">Extensões</h2>
            <ExpansaoCard v-for="ext in extensoes" :key="ext.id" :expansao="ext" />
        </div>
    </div>
</template>

<style scoped>
    .jogo-container {
        color: black;
        padding: 1rem 2rem;
    }

    .jogo-title {
        margin: 0px;
        font-size: 2.5rem;
        font-weight: bold;
        text-transform: uppercase;
        border-bottom: 2px solid #ccc;
        padding-bottom: 0.5rem;
    }

    .jogo-content {
        display: flex;
        flex-direction: row;
        gap: 2rem;
        flex-wrap: wrap;
    }

    .jogo-image {
        width: 100%;
        max-width: 500px;
        border-radius: 6px;
        object-fit: cover;
        box-shadow: 0 2px 12px rgba(0,0,0,0.2);
    }

    .jogo-details {
        flex: 1;
        min-width: 280px;
    }

    .descricao {
        font-size: 1.5rem;
        margin-bottom: 1.5rem;
    }

    .detalhes-tabela {
        width: 100%;
        font-size: 1.4rem;
        border-collapse: collapse;
    }

    .detalhes-tabela th {
        width: 30%;
        padding: 0.5rem;
        text-align: left;
        vertical-align: top;
    }

    .detalhes-tabela td {
        padding: 0.5rem;
    }

    .manual-link {
        color: #0077cc;
        text-decoration: underline;
    }

    .manual-link:hover {
        color: #005fa3;
    }

    .carregando {
        text-align: center;
        font-size: 1.2rem;
        padding: 2rem;
    }

    .extensao-title {
        font-size: 2rem;
        margin-bottom: 0.5rem;
        border-bottom: 2px solid #ccc;
        padding-bottom: 0.5rem;
    }

</style>
