<template>
  <div class="about-container">
    <h1 class="about-title">Sobre o LudoWiki</h1>

    <p class="about-description">
      O <strong>LudoWiki</strong> é um catálogo digital dedicado a jogos de mesa em geral. Nosso objetivo é fornecer uma fonte clara, organizada e acessível para você explorar jogos incríveis, entender suas mecânicas e descobrir expansões que enriquecem ainda mais a experiência.
    </p>

    <p>
      Navegue pelo catálogo para visualizar jogos com detalhes como: duração, número máximo de jogadores, gênero e manual em PDF. Ao clicar em um jogo, você terá acesso a uma página detalhada com todas essas informações, além de ver as expansões disponíveis.
    </p>

    <h2 class="about-subtitle">Funcionalidades principais:</h2>
    <ul class="about-list">
      <li>📚 Catálogo completo de jogos de mesa</li>
      <li>🔍 Visualização detalhada de cada jogo</li>
      <li>🧩 Listagem de expansões relacionadas a cada jogo</li>
      <li>📄 Links diretos para manuais em PDF</li>
    </ul>

    <p class="about-footer">
      Este projeto é feito com 💙 por entusiastas de jogos de mesa. Esperamos que o LudoWiki ajude você a descobrir novos jogos e a aproveitar ainda mais os que já ama!
    </p>
  </div>
</template>

<script setup lang="ts">
</script>

<style scoped>
.about-container {
  padding: 1rem 2rem;
  line-height: 1.6;
  color: black;
}

.about-title {
  margin: 0px;
  font-size: 2.4rem;
  border-bottom: 2px solid #ccc;
}

.about-subtitle {
  margin-top: 2rem;
  font-size: 1.6rem;
}

.about-description {
  font-size: 1.1rem;
  margin-bottom: 1rem;
}

.about-list {
  padding-left: 1.5rem;
  margin-top: 1rem;
  list-style: none;
}

.about-list li {
  margin-bottom: 0.5rem;
  position: relative;
}

.about-footer {
  margin-top: 2rem;
  font-style: italic;
  color: #555;
}
</style>