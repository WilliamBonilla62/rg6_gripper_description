
# 🦾 RG6 Gripper URDF Converter (ROS 1 → ROS 2 Compatible)

This repo originally comes from an old ROS 1 package that provides the **RG6 Gripper URDF** under the `rg6_gripper_description` package.

👉 Unfortunately, **the original package was only compatible with ROS 1**, and I'm working in **Isaac Sim** where I need a clean `.urdf` file for simulation.

---

## 🐳 Why Docker?

Since most of us have moved on to **ROS 2**, I created a **ROS 1 (Noetic)** Docker container to:
- Build the original ROS 1 Catkin workspace
- Convert the Xacro file into a usable URDF file
- Share the result back to the host machine for use in ROS 2 / Isaac Sim / anything else

---

## 🚀 How to use

### 🔨 Step 1: Build and run the Docker container
This will build the image and run the container with a shared volume mount to your current directory:

```bash
./build_and_run.sh
```

This uses:
```bash
-v $(pwd):/ros_ws/src/rg6_gripper_description
```

Which means **any URDF generated inside the container will appear in your local folder automatically** ✅

---

### 🐚 Step 2: Inside the container

Once you're in the container, run the script to build the Catkin workspace and convert the URDF:

```bash
./build_and_convert.sh
```

You should see a message like:

```
[✓] Successfully converted to: /ros_ws/src/rg6_gripper_description/urdf/rg6_gripper.urdf
```

This `.urdf` file will now be available **on your host machine** in `urdf/rg6_gripper.urdf` 🎉

---

## 📦 Summary

| Script                | Description                                 |
|-----------------------|---------------------------------------------|
| `build_and_run.sh`    | Builds and runs the Docker container 🐳      |
| `build_and_convert.sh`| Converts the `.xacro` to `.urdf` inside ROS 1 |

---

## 🔁 Use case

This setup can be reused for **any old ROS 1 package** that generates URDFs using `xacro`. You can:
- Run them in a contained Docker image
- Generate `.urdf` files
- Use them in ROS 2 or simulation frameworks like Isaac or Gazebo

---

## 🙌 Contributions

These are **my contributions** to this repo:
- Added `Dockerfile` to run ROS 1
- Added `build_and_run.sh` to automate everything
- Added `build_and_convert.sh` to build and extract URDFs
- Generated and exported a fresh `rg6_gripper.urdf` ✅

Hope it helps someone else stuck in the ROS 1 → ROS 2 transition! 🛠️
