<script setup lang="ts">
import { onMounted, ref } from 'vue';
import axios from '@/plugins/axios';
import { Card } from 'primevue';
import { RouterLink } from 'vue-router';

const jogos = ref<any[]>([])

onMounted(async () => {
    try {
        const response = await axios.get('/jogos/')
        jogos.value = response.data
    } catch (err) {
        console.log('Erro ao buscar jogos:', err)
    }
})
</script>

<template>
  <main class="catalog-container">
    <RouterLink
      v-for="j in jogos"
      :key="j.id"
      :to="`/catalog/${j.id}`"
      class="card-link"
    >
      <Card class="jogo-card">
        <template #header>
          <img alt="user header" :src="j.img" class="card-image" />
        </template>
        <template #title>{{ j.nome }}</template>
        <template #subtitle>Jogadores: {{ j.max_players }}</template>
        <template #content>
          <p class="m-0">
            {{ j.descricao }}
          </p>
        </template>
      </Card>
    </RouterLink>
  </main>
</template>

<style scoped>
.catalog-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 1.5rem;
  padding: 2rem;
  justify-content: center;
}

.card-link {
  text-decoration: none;
  color: inherit;
  transition: transform 0.3s ease;
}

.jogo-card {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  cursor: pointer;
}

.card-link:hover .jogo-card {
  transform: scale(1.03);
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
}

.card-image {
  width: 100%;
  height: 300px;
  object-fit: cover;
  border: #3d3d3d 2px solid;
  border-top-left-radius: 1rem;
  border-top-right-radius: 1rem;
}

.p-card {
  height: 100%;
  display: flex;
  flex-direction: column;
  background-color: #3d3d3d;
}

.p-card-body {
  flex-grow: 1; 
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}

</style>
