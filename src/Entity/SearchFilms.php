<?php

namespace App\Entity;

class SearchFilms
{
    /**
     * @var Categories[]
     */
    private $categories = [];

    private $tags = null;
    private $acteurs = [];

    public function getCategories(): ?array
    {
        return $this->categories;
    }

    public function setCategories(?array $categories): self
    {
        $this->categories = $categories;

        return $this;
    }

    public function getTags(): ?string
    {
        return $this->tags;
    }

    public function setTags(?string $tags): self
    {
        $this->tags = $tags;

        return $this;
    }

    public function getActeurs(): ?array
    {
        return $this->acteurs;
    }

    public function setActeurs(?array $acteurs): self
    {
        $this->acteurs = $acteurs;

        return $this;
    }
}
