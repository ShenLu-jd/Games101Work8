#include <iostream>
#include <vector>

#include "CGL/vector2D.h"

#include "mass.h"
#include "rope.h"
#include "spring.h"

namespace CGL {

    Rope::Rope(Vector2D start, Vector2D end, int num_nodes, float node_mass, float k, vector<int> pinned_nodes)
    {
        // TODO (Part 1): Create a rope starting a `start`, ending a `end`, and containing `num_nodes` nodes.

        Vector2D dir = (end - start) / num_nodes;
        for (int i = 0; i < num_nodes; i++)
        {
            Vector2D curPos = start + dir * i;
            Mass* massTemp = new Mass(curPos, node_mass, false);
            masses.push_back(massTemp);
        }

        for (int i = 0; i < num_nodes - 1; i++)
        {
            Spring* springTemp = new Spring(masses[i], masses[i+1], k);
            springs.push_back(springTemp);
        }

        // Comment-in this part when you implement the constructor
        for (auto &i : pinned_nodes) {
            masses[i]->pinned = true;
        }
    }

    void Rope::simulateEuler(float delta_t, Vector2D gravity)
    {
        for (auto &s : springs)
        {
            // TODO (Part 2): Use Hooke's law to calculate the force on a node

            Vector2D a = s->m1->position, b = s->m2->position;
            float len = (b - a).norm();
            Vector2D f = s->k * (b - a) / len * (len - s->rest_length);
            // 累加起来
            s->m1->forces += f;
            s->m2->forces -= f; // 反向则要减去
        }

        float k_d = 0.005f; // 阻力系数
        for (auto &m : masses)
        {
            if (!m->pinned)
            {
                // TODO (Part 2): Add the force due to gravity, then compute the new velocity and position

                m->forces -= k_d * m->velocity; // 阻力
                Vector2D at = m->forces / m->mass + gravity; // 加上重力的加速度 计算最后的加速度

                Vector2D vt1 = m->velocity + at * delta_t;  // 新的速度
                // 新的位置,显示欧拉,不稳定(这句注释不能放在下一行代码的后面，会报错)
                //Vector2D xt1 = m->position + m->velocity * delta_t;
                // 新的位置,半隐式欧拉,稳定
                Vector2D xt1 = m->position + vt1 * delta_t; 

                m->velocity = vt1;
                m->position = xt1;

                // TODO (Part 2): Add global damping
            }

            // Reset all forces on each mass
            m->forces = Vector2D(0, 0);
        }
    }

    void Rope::simulateVerlet(float delta_t, Vector2D gravity)
    {
        for (auto &s : springs)
        {
            // TODO (Part 3): Simulate one timestep of the rope using explicit Verlet （solving constraints)

            Vector2D a = s->m1->position, b = s->m2->position;
            float len = (b - a).norm();
            Vector2D f = s->k * (b - a) / len * (len - s->rest_length);
            // 累加起来
            s->m1->forces += f;
            s->m2->forces -= f; // 反向则要减去
        }

        float damping_factor = 0.00005f; // 阻力系数
        for (auto &m : masses)
        {
            if (!m->pinned)
            {
                Vector2D temp_position = m->position;
                // TODO (Part 3.1): Set the new position of the rope mass
                Vector2D a = m->forces / m->mass + gravity;
                m->position = temp_position + (1- damping_factor) * (temp_position - m->last_position) + a * delta_t * delta_t;
                m->last_position = temp_position;

                // TODO (Part 4): Add global Verlet damping
            }
            // Reset all forces on each mass
            m->forces = Vector2D(0, 0);
        }

    }
}
