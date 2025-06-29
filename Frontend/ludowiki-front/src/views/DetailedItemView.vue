<script setup lang="ts">
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router';
import axios from '@/plugins/axios';
import Accordion from 'primevue/accordion';
import AccordionPanel from 'primevue/accordionpanel';
import AccordionHeader from 'primevue/accordionheader';
import AccordionContent from 'primevue/accordioncontent';


console.log('hello');

const route = useRoute()
const rawId = route.params.id
const id = Array.isArray(rawId) ? parseInt(rawId[0]) : parseInt(rawId)

const jogo = ref<any>({})
const extensoes = ref<any[]>([])

onMounted(async () => {
    try {
        const jogoResponse = await axios.get(`/jogos/${id}`)
        jogo.value = jogoResponse.data

        const generoResponse = await axios.get(`/generos/${id}`)
        jogo.value.genero = generoResponse.data

        const extensaoResponse = await axios.get(`/extensoes/`)
        extensoes.value = extensaoResponse.data.filter((ext: any) => ext.jogo_base === id)

        console.log(extensoes.value);
    } catch (err) {
        console.log('Erro ao buscar jogo ou gênero:', err)
    }
})

const formatarDuracao = (duracao: string) => {
    const [h, m] = duracao.split(':')
    const horas = parseInt(h)
    const minutos = parseInt(m)
    if (horas > 0) {
        return `${horas}h ${minutos}min`
    }
    return `${minutos} minutos`
}

</script>

<template>
    <div class="jogo-container" v-if="jogo && jogo.nome">
        <h1 class="jogo-title">{{ jogo.nome }}</h1>

        <div class="jogo-content">
            <img :src="jogo.img" :alt="jogo.nome" class="jogo-image" />

            <div class="jogo-details">
                <p class="descricao">{{ jogo.descricao }}</p>

                <table class="detalhes-tabela">
                    <tr>
                        <th>Ano de Lançamento:</th>
                        <td>{{ jogo.ano }}</td>
                    </tr>
                    <tr>
                        <th>Duração Média:</th>
                        <td>{{ formatarDuracao(jogo.duracao) }}</td>
                    </tr>
                    <tr>
                        <th>Máx. Jogadores:</th>
                        <td>{{ jogo.max_players }}</td>
                    </tr>
                    <tr>
                        <th>Gênero:</th>
                        <td>{{ jogo.genero.nome }}</td>
                    </tr>
                    <tr>
                        <th>Manual:</th>
                        <td><a :href="jogo.manual" target="_blank" class="manual-link">Ver manual (PDF)</a></td>
                    </tr>
                </table>
            </div>
        </div>

        <h2 class="extensao-title">Extensões</h2>
        <div class="accordion card">
            <Accordion v-for="ext in extensoes" :value="ext.id">
                <AccordionPanel value="0">
                    <AccordionHeader>{{ext.nome}} - {{ext.ano}}</AccordionHeader>
                    <AccordionContent>
                            {{ext.descricao}}
                    </AccordionContent>
                </AccordionPanel>
            </Accordion>
        </div>
    </div>
    <div v-else class="carregando">Carregando jogo...</div>

</template>

<style scoped>
.jogo-container {
    max-width: 1000px;
    margin: 2rem auto;
    padding: 2rem;
    font-family: 'Segoe UI', sans-serif;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
}

.jogo-title {
    font-size: 2.5rem;
    margin-bottom: 1.5rem;
    border-bottom: 2px solid #ccc;
    padding-bottom: 0.5rem;
    color: #333;
}

.jogo-content {
    display: flex;
    flex-direction: row;
    gap: 2rem;
    flex-wrap: wrap;
}

.jogo-image {
    max-width: 400px;
    width: 100%;
    border-radius: 6px;
    object-fit: cover;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.2);
}

.jogo-details {
    flex: 1;
    min-width: 280px;
}

.descricao {
    font-size: 1.1rem;
    margin-bottom: 1.5rem;
    color: #333;
}

.detalhes-tabela {
    width: 100%;
    border-collapse: collapse;
    color: #333;
}

.detalhes-tabela th {
    text-align: left;
    padding: 0.5rem;
    width: 180px;
    vertical-align: top;
    background-color: #f9f9f9;
}

.detalhes-tabela td {
    padding: 0.5rem;
    background-color: #fcfcfc;
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
    color: #333;
}

.accordion{
    padding-top: 3rem;
}
</style>
